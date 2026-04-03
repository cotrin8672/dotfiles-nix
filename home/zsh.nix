{ lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh";
      }
    ];
    initContent = lib.mkMerge [
      (lib.mkOrder 550 ''
      export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

      source "${pkgs.zsh-powerlevel10k}/share/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme"
      [[ -r "$HOME/.config/p10k/p10k.zsh" ]] && source "$HOME/.config/p10k/p10k.zsh"

      '')
      ''
      _zsh_autosuggest_bind_widgets
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      bindkey '^[OA' history-substring-search-up
      bindkey '^[OB' history-substring-search-down
      ''
    ];
  };

  xdg.configFile."p10k/p10k.zsh".source = ../zsh/p10k.zsh;
}
