{ config, pkgs, llm-agents, ... }:

{
  imports = [
    ./direnv.nix
    ./gwq.nix
    ./neovim.nix
    ./zsh.nix
  ];

  home.username = "cotrin";
  home.homeDirectory = "/home/cotrin";

  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    KOTLIN_LSP_DIR = "${pkgs.kotlin-lsp}/share/kotlin-lsp";
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
    google-java-format
    jdt-language-server
    ktfmt
    kotlin-lsp
    sheldon
  ];
}
