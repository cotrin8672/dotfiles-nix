{ pkgs, ... }:

let
  plugins = {
    lazy_nvim = pkgs.vimPlugins."lazy-nvim";
    blink_cmp = pkgs.vimPlugins."blink-cmp";
    lspconfig = pkgs.vimPlugins.nvim-lspconfig;
    wisteria = pkgs.vimPlugins.wisteria-nvim;
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

  lazyLua = pkgs.replaceVars ../nvim/lua/config/lazy.lua {
    inherit (plugins) lazy_nvim blink_cmp treesitter lspconfig wisteria;
  };
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
    xdg.configFile."nvim/lua/plugins/treesitter.lua".source = ../nvim/lua/plugins/treesitter.lua;
    xdg.configFile."nvim/lua/plugins/blink.lua".source = ../nvim/lua/plugins/blink.lua;
    xdg.configFile."nvim/lua/plugins/lsp.lua".source = ../nvim/lua/plugins/lsp.lua;
    xdg.configFile."nvim/lua/plugins/wisteria.lua".source = ../nvim/lua/plugins/wisteria.lua;
    xdg.configFile."nvim/lua/config/lazy.lua".source = lazyLua;
  }

