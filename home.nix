{ config, pkgs, llm-agents, ... }:

{
  home.username = "cotrin";
  home.homeDirectory = "/home/cotrin";

  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.home-manager.enable = true;

  home.packages = with (pkgs // llm-agents.packages.${pkgs.system}); [
    chezmoi
    git
    gh
    neovim
    nushell
    codex
    claude-code
  ];
}
