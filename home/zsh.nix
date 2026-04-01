{ lib, pkgs, ... }:

let
  sheldonPluginsToml = pkgs.replaceVars ../zsh/plugins.toml {
    autosuggestions = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
    fast_syntax_highlighting = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting";
    history_substring_search = "${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search";
    zsh_completions = "${pkgs.zsh-completions}/share/zsh/site-functions";
  };
in

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    initContent = lib.mkMerge [
      (lib.mkOrder 550 ''
      export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

      eval "$(${pkgs.sheldon}/bin/sheldon source)"
      source "${pkgs.zsh-powerlevel10k}/share/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme"
      [[ -r "$HOME/.config/p10k/p10k.zsh" ]] && source "$HOME/.config/p10k/p10k.zsh"

      autoload -U compinit

      zcompdump_dir="''${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
      mkdir -p "$zcompdump_dir"
      zcompdump_path="$zcompdump_dir/.zcompdump"

      if [[ -f "$zcompdump_path" && -n "$zcompdump_path"(#qN.mh+24) ]]; then
        compinit -d "$zcompdump_path"
      else
        compinit -C -d "$zcompdump_path"
      fi

      '')
      ''
      _zsh_autosuggest_bind_widgets
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      ''
    ];
  };

  xdg.configFile."sheldon/plugins.toml".source = sheldonPluginsToml;
  xdg.configFile."p10k/p10k.zsh".source = ../zsh/p10k.zsh;
}
