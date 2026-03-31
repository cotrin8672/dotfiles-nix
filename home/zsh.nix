{ lib, pkgs, ... }:

let
  sheldonPluginsToml = pkgs.replaceVars ../zsh/plugins.toml {
    autosuggestions = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
    history_substring_search = "${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search";
    zsh_abbr = "${pkgs.zsh-abbr}/share/zsh/zsh-abbr";
    zsh_completions = "${pkgs.zsh-completions}/share/zsh/site-functions";
    syntax_highlighting = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting";
  };
in

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    initContent = lib.mkMerge [
      (lib.mkOrder 550 ''
      eval "$(${pkgs.sheldon}/bin/sheldon source)"

      autoload -U compinit

      if [[ -n "${ZDOTDIR:-}" ]]; then
        zcompdump_path="$ZDOTDIR/.zcompdump"
      else
        zcompdump_path="$HOME/.zcompdump"
      fi

      if [[ -f "$zcompdump_path" && -n "$zcompdump_path"(#qN.mh+24) ]]; then
        compinit -d "$zcompdump_path"
      else
        compinit -C -d "$zcompdump_path"
      fi

      cd "$HOME"
      '')
      ''
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      ''
    ];
  };

  xdg.configFile."sheldon/plugins.toml".source = sheldonPluginsToml;
}
