{ pkgs, lib, ... }:

let
  plugins = {
    lazy_nvim = pkgs.vimPlugins."lazy-nvim";
    barbar = pkgs.vimPlugins."barbar-nvim";
    blink_cmp = pkgs.vimPlugins."blink-cmp";
    dial = pkgs.vimPlugins."dial-nvim";
    everforest = pkgs.vimPlugins.everforest;
    fidget = pkgs.vimPlugins."fidget-nvim";
    guess_indent = pkgs.vimPlugins."guess-indent-nvim";
    gitsigns = pkgs.vimPlugins."gitsigns-nvim";
    hlchunk = pkgs.vimPlugins."hlchunk-nvim";
    hlslens = pkgs.vimPlugins."nvim-hlslens";
    lspconfig = pkgs.vimPlugins.nvim-lspconfig;
    lualine = pkgs.vimPlugins."lualine-nvim";
    mini_icons = pkgs.vimPlugins."mini-icons";
    mini_nvim = pkgs.vimPlugins."mini-nvim";
    neodim = pkgs.vimPlugins.neodim;
    noice = pkgs.vimPlugins."noice-nvim";
    nui = pkgs.vimPlugins."nui-nvim";
    nvim_autopairs = pkgs.vimPlugins."nvim-autopairs";
    nvim_notify = pkgs.vimPlugins."nvim-notify";
    rainbow_delimiters = pkgs.vimPlugins."rainbow-delimiters-nvim";
    smear_cursor = pkgs.vimPlugins."smear-cursor-nvim";
    treesj = pkgs.vimPlugins.treesj;
    treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins ( plugins: with plugins; [
      bash
      zsh
      lua
      markdown
      markdown_inline
      nix
      css
      html
      java
      javascript
      json
      kotlin
      rust
      toml
      tsx
      typescript
    ]);
  };

  nixPathsLua = pkgs.writeText "nix_paths.lua" (
    "return " + lib.generators.toLua {} {
      lazy_nvim = "${plugins.lazy_nvim}";
      barbar = "${plugins.barbar}";
      blink_cmp = "${plugins.blink_cmp}";
      dial = "${plugins.dial}";
      everforest = "${plugins.everforest}";
      fidget = "${plugins.fidget}";
      guess_indent = "${plugins.guess_indent}";
      gitsigns = "${plugins.gitsigns}";
      hlchunk = "${plugins.hlchunk}";
      hlslens = "${plugins.hlslens}";
      lspconfig = "${plugins.lspconfig}";
      lualine = "${plugins.lualine}";
      mini_icons = "${plugins.mini_icons}";
      mini_nvim = "${plugins.mini_nvim}";
      neodim = "${plugins.neodim}";
      noice = "${plugins.noice}";
      nui = "${plugins.nui}";
      nvim_autopairs = "${plugins.nvim_autopairs}";
      nvim_notify = "${plugins.nvim_notify}";
      treesj = "${plugins.treesj}";
      treesitter = "${plugins.treesitter}";
      treesitter_parsers = map toString (plugins.treesitter.dependencies or []);
      rainbow_delimiters = "${plugins.rainbow_delimiters}";
      smear_cursor = "${plugins.smear_cursor}";
      vim_edgemotion = "${pkgs.vimPlugins.vim-edgemotion}";
    }
  );
in
  {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      extraPackages = with pkgs; [
        lua-language-server
	nixd
	bash-language-server
	vscode-langservers-extracted
	typescript-language-server
	typescript
	rust-analyzer
	taplo
	marksman
      ];
    };

    xdg.configFile."nvim/init.lua".source = ../nvim/init.lua;

    xdg.configFile."nvim/lua/plugins/barbar.lua".source = ../nvim/lua/plugins/barbar.lua;
    xdg.configFile."nvim/lua/plugins/blink.lua".source = ../nvim/lua/plugins/blink.lua;
    xdg.configFile."nvim/lua/plugins/dial.lua".source = ../nvim/lua/plugins/dial.lua;
    xdg.configFile."nvim/lua/plugins/edgemotion.lua".source = ../nvim/lua/plugins/edgemotion.lua;
    xdg.configFile."nvim/lua/plugins/gitsigns.lua".source = ../nvim/lua/plugins/gitsigns.lua;
    xdg.configFile."nvim/lua/plugins/guess-indent.lua".source = ../nvim/lua/plugins/guess-indent.lua;
    xdg.configFile."nvim/lua/plugins/fidget.lua".source = ../nvim/lua/plugins/fidget.lua;
    xdg.configFile."nvim/lua/plugins/hlchunk.lua".source = ../nvim/lua/plugins/hlchunk.lua;
    xdg.configFile."nvim/lua/plugins/hlslens.lua".source = ../nvim/lua/plugins/hlslens.lua;
    xdg.configFile."nvim/lua/plugins/lsp.lua".source = ../nvim/lua/plugins/lsp.lua;
    xdg.configFile."nvim/lua/plugins/lualine.lua".source = ../nvim/lua/plugins/lualine.lua;
    xdg.configFile."nvim/lua/plugins/mini-animate.lua".source = ../nvim/lua/plugins/mini-animate.lua;
    xdg.configFile."nvim/lua/plugins/mini-icons.lua".source = ../nvim/lua/plugins/mini-icons.lua;
    xdg.configFile."nvim/lua/plugins/mini-pick.lua".source = ../nvim/lua/plugins/mini-pick.lua;
    xdg.configFile."nvim/lua/plugins/neodim.lua".source = ../nvim/lua/plugins/neodim.lua;
    xdg.configFile."nvim/lua/plugins/noice.lua".source = ../nvim/lua/plugins/noice.lua;
    xdg.configFile."nvim/lua/plugins/nvim-autopairs.lua".source = ../nvim/lua/plugins/nvim-autopairs.lua;
    xdg.configFile."nvim/lua/plugins/rainbow-delimiters.lua".source = ../nvim/lua/plugins/rainbow-delimiters.lua;
    xdg.configFile."nvim/lua/plugins/smear-cursor.lua".source = ../nvim/lua/plugins/smear-cursor.lua;
    xdg.configFile."nvim/lua/plugins/treesj.lua".source = ../nvim/lua/plugins/treesj.lua;
    xdg.configFile."nvim/lua/plugins/treesitter.lua".source = ../nvim/lua/plugins/treesitter.lua;
    xdg.configFile."nvim/lua/plugins/everforest.lua".source = ../nvim/lua/plugins/everforest.lua;

    xdg.configFile."nvim/lua/shared/diagnostic_icons.lua".source = ../nvim/lua/shared/diagnostic_icons.lua;
    xdg.configFile."nvim/lua/ui/diagnostic_icons.lua".source = ../nvim/lua/ui/diagnostic_icons.lua;

    home.file.".config/nvim/lua/nix_paths.lua".source = nixPathsLua;
  }
