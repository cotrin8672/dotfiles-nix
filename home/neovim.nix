{ pkgs, ... }:

let
  plugins = {
    lazy = pkgs.vimPlugins."lazy-nvim";
    blink = pkgs.vimPlugins."blink-cmp";
    treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins ( plugins: with plugins; [
      bash
      zsh
      lua
      markdown
      markdown_inline
      nix
    ]);
  };

  lazyLua = pkgs.substituteAll {
    src = ../nvim/lua/config/lazy.lua;
    inherit (plugins) lazy_nvim blink_cmp treesitter;
  };
in
  {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };

    xdg.configFile."nvim/init.lua".source = ../nvim/init.lua;
    xdg.configFile."nvim/lua/plugins/treesitter.lua" = ../nvim/lua/plugins/treesitter.lua;
    xdg.configFile."nvim/lua/plugins/blink.lua" = ../nvim/lua/plugins/blink.lua;
    xdg.configFile."nvim/lua/config/lazy.lua" = lazy.lua;
  }

