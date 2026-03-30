{ config, pkgs, llm-agents, ... }:

{
  imports = [
    ./gwq.nix
    ./neovim.nix
  ];

  home.username = "cotrin";
  home.homeDirectory = "/home/cotrin";

  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.home-manager.enable = true;

  home.packages = with (pkgs // llm-agents.packages.${pkgs.stdenv.hostPlatform.system}); [
    chezmoi
    git
    gh
    nushell
    codex
    claude-code
    ripgrep
    fd
    fzf
    bat
    pkgs."vim-startuptime"
    eza
    zoxide
    dust
    ghq
  ];
}
