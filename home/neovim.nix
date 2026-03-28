{ pkgs, lib, ... }:

let
  plugins = {
    lazy_nvim = pkgs.vimPlugins."lazy-nvim";
    barbar = pkgs.vimPlugins."barbar-nvim";
    blink_cmp = pkgs.vimPlugins."blink-cmp";
    comment = pkgs.vimPlugins."comment-nvim";
    conform = pkgs.vimPlugins."conform-nvim";
    crates = pkgs.vimPlugins."crates-nvim";
    dial = pkgs.vimPlugins."dial-nvim";
    everforest = pkgs.vimPlugins."everforest-nvim";
    flash = pkgs.vimPlugins."flash-nvim";
    fidget = pkgs.vimPlugins."fidget-nvim";
    guess_indent = pkgs.vimPlugins."guess-indent-nvim";
    gitsigns = pkgs.vimPlugins."gitsigns-nvim";
    hlchunk = pkgs.vimPlugins."hlchunk-nvim";
    hlslens = pkgs.vimPlugins."nvim-hlslens";
    inc_rename = pkgs.vimPlugins."inc-rename-nvim";
    lspconfig = pkgs.vimPlugins.nvim-lspconfig;
    lsp_signature = pkgs.vimPlugins.lsp_signature-nvim;
    lspsaga = pkgs.vimPlugins."lspsaga-nvim";
    lualine = pkgs.vimPlugins."lualine-nvim";
    mkdir = pkgs.vimPlugins."mkdir-nvim";
    mini_bufremove = pkgs.vimPlugins."mini-bufremove";
    mini_extra = pkgs.vimPlugins."mini-extra";
    mini_files = pkgs.vimPlugins."mini-files";
    mini_icons = pkgs.vimPlugins."mini-icons";
    mini_nvim = pkgs.vimPlugins."mini-nvim";
    nvim_submode = pkgs.vimPlugins."nvim-submode";
    neodim = pkgs.vimPlugins.neodim;
    neoscroll = pkgs.vimPlugins."neoscroll-nvim";
    noice = pkgs.vimPlugins."noice-nvim";
    oil = pkgs.vimPlugins."oil-nvim";
    oil_git_status = pkgs.vimPlugins."oil-git-status-nvim";
    nui = pkgs.vimPlugins."nui-nvim";
    nvim_autopairs = pkgs.vimPlugins."nvim-autopairs";
    nvim_dap = pkgs.vimPlugins."nvim-dap";
    nvim_dap_ui = pkgs.vimPlugins."nvim-dap-ui";
    nvim_dap_virtual_text = pkgs.vimPlugins."nvim-dap-virtual-text";
    nio = pkgs.vimPlugins.nvim-nio;
    nvim_notify = pkgs.vimPlugins."nvim-notify";
    nvim_ts_autotag = pkgs.vimPlugins."nvim-ts-autotag";
    nvim_treesitter_context = pkgs.vimPlugins."nvim-treesitter-context";
    nvim_web_devicons = pkgs.vimPlugins."nvim-web-devicons";
    rainbow_delimiters = pkgs.vimPlugins."rainbow-delimiters-nvim";
    satellite = pkgs.vimPlugins."satellite-nvim";
    smear_cursor = pkgs.vimPlugins."smear-cursor-nvim";
    smart_splits = pkgs.vimPlugins."smart-splits-nvim";
    tiny_inline_diagnostic = pkgs.vimPlugins."tiny-inline-diagnostic-nvim";
    trouble = pkgs.vimPlugins."trouble-nvim";
    ts_context_commentstring = pkgs.vimPlugins."nvim-ts-context-commentstring";
    treesj = pkgs.vimPlugins.treesj;
    undo_glow = pkgs.vimPlugins."undo-glow-nvim";
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
      comment = "${plugins.comment}";
      conform = "${plugins.conform}";
      crates = "${plugins.crates}";
      dial = "${plugins.dial}";
      everforest = "${plugins.everforest}";
      flash = "${plugins.flash}";
      fidget = "${plugins.fidget}";
      guess_indent = "${plugins.guess_indent}";
      gitsigns = "${plugins.gitsigns}";
      hlchunk = "${plugins.hlchunk}";
      hlslens = "${plugins.hlslens}";
      inc_rename = "${plugins.inc_rename}";
      lspconfig = "${plugins.lspconfig}";
      lsp_signature = "${plugins.lsp_signature}";
      lspsaga = "${plugins.lspsaga}";
      lualine = "${plugins.lualine}";
      mkdir = "${plugins.mkdir}";
      mini_bufremove = "${plugins.mini_bufremove}";
      mini_extra = "${plugins.mini_extra}";
      mini_files = "${plugins.mini_files}";
      mini_icons = "${plugins.mini_icons}";
      mini_nvim = "${plugins.mini_nvim}";
      nvim_submode = "${plugins.nvim_submode}";
      neodim = "${plugins.neodim}";
      neoscroll = "${plugins.neoscroll}";
      noice = "${plugins.noice}";
      oil = "${plugins.oil}";
      oil_git_status = "${plugins.oil_git_status}";
      nui = "${plugins.nui}";
      nvim_autopairs = "${plugins.nvim_autopairs}";
      nvim_dap = "${plugins.nvim_dap}";
      nvim_dap_ui = "${plugins.nvim_dap_ui}";
      nvim_dap_virtual_text = "${plugins.nvim_dap_virtual_text}";
      nio = "${plugins.nio}";
      nvim_notify = "${plugins.nvim_notify}";
      nvim_ts_autotag = "${plugins.nvim_ts_autotag}";
      nvim_treesitter_context = "${plugins.nvim_treesitter_context}";
      nvim_web_devicons = "${plugins.nvim_web_devicons}";
      tiny_inline_diagnostic = "${plugins.tiny_inline_diagnostic}";
      trouble = "${plugins.trouble}";
      ts_context_commentstring = "${plugins.ts_context_commentstring}";
      treesj = "${plugins.treesj}";
      undo_glow = "${plugins.undo_glow}";
      treesitter = "${plugins.treesitter}";
      treesitter_parsers = map toString (plugins.treesitter.dependencies or []);
      rainbow_delimiters = "${plugins.rainbow_delimiters}";
      satellite = "${plugins.satellite}";
      smear_cursor = "${plugins.smear_cursor}";
      smart_splits = "${plugins.smart_splits}";
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
        stylua
        shfmt
        alejandra
        statix
        deadnix
        markdownlint-cli
        rustfmt
      ];
    };

    xdg.configFile."nvim/init.lua".source = ../nvim/init.lua;

    xdg.configFile."nvim/lua/plugins/barbar.lua".source = ../nvim/lua/plugins/barbar.lua;
    xdg.configFile."nvim/lua/plugins/blink.lua".source = ../nvim/lua/plugins/blink.lua;
    xdg.configFile."nvim/lua/plugins/comment.lua".source = ../nvim/lua/plugins/comment.lua;
    xdg.configFile."nvim/lua/plugins/conform.lua".source = ../nvim/lua/plugins/conform.lua;
    xdg.configFile."nvim/lua/plugins/crates.lua".source = ../nvim/lua/plugins/crates.lua;
    xdg.configFile."nvim/lua/plugins/dap.lua".source = ../nvim/lua/plugins/dap.lua;
    xdg.configFile."nvim/lua/plugins/dap-ui.lua".source = ../nvim/lua/plugins/dap-ui.lua;
    xdg.configFile."nvim/lua/plugins/dap-virtual-text.lua".source = ../nvim/lua/plugins/dap-virtual-text.lua;
    xdg.configFile."nvim/lua/plugins/dial.lua".source = ../nvim/lua/plugins/dial.lua;
    xdg.configFile."nvim/lua/plugins/edgemotion.lua".source = ../nvim/lua/plugins/edgemotion.lua;
    xdg.configFile."nvim/lua/plugins/gitsigns.lua".source = ../nvim/lua/plugins/gitsigns.lua;
    xdg.configFile."nvim/lua/plugins/guess-indent.lua".source = ../nvim/lua/plugins/guess-indent.lua;
    xdg.configFile."nvim/lua/plugins/fidget.lua".source = ../nvim/lua/plugins/fidget.lua;
    xdg.configFile."nvim/lua/plugins/hlchunk.lua".source = ../nvim/lua/plugins/hlchunk.lua;
    xdg.configFile."nvim/lua/plugins/hlslens.lua".source = ../nvim/lua/plugins/hlslens.lua;
    xdg.configFile."nvim/lua/plugins/inc-rename.lua".source = ../nvim/lua/plugins/inc-rename.lua;
    xdg.configFile."nvim/lua/plugins/lsp.lua".source = ../nvim/lua/plugins/lsp.lua;
    xdg.configFile."nvim/lua/plugins/lsp-signature.lua".source = ../nvim/lua/plugins/lsp-signature.lua;
    xdg.configFile."nvim/lua/plugins/lspsaga.lua".source = ../nvim/lua/plugins/lspsaga.lua;
    xdg.configFile."nvim/lua/plugins/lualine.lua".source = ../nvim/lua/plugins/lualine.lua;
    xdg.configFile."nvim/lua/plugins/mkdir.lua".source = ../nvim/lua/plugins/mkdir.lua;
    xdg.configFile."nvim/lua/plugins/mini-bufremove.lua".source = ../nvim/lua/plugins/mini-bufremove.lua;
    xdg.configFile."nvim/lua/plugins/mini-extra.lua".source = ../nvim/lua/plugins/mini-extra.lua;
    xdg.configFile."nvim/lua/plugins/mini-icons.lua".source = ../nvim/lua/plugins/mini-icons.lua;
    xdg.configFile."nvim/lua/plugins/mini.lua".source = ../nvim/lua/plugins/mini.lua;
    xdg.configFile."nvim/lua/plugins/submode.lua".source = ../nvim/lua/plugins/submode.lua;
    xdg.configFile."nvim/lua/plugins/neodim.lua".source = ../nvim/lua/plugins/neodim.lua;
    xdg.configFile."nvim/lua/plugins/neoscroll.lua".source = ../nvim/lua/plugins/neoscroll.lua;
    xdg.configFile."nvim/lua/plugins/noice.lua".source = ../nvim/lua/plugins/noice.lua;
    xdg.configFile."nvim/lua/plugins/oil-git-status.lua".source = ../nvim/lua/plugins/oil-git-status.lua;
    xdg.configFile."nvim/lua/plugins/oil.lua".source = ../nvim/lua/plugins/oil.lua;
    xdg.configFile."nvim/lua/plugins/nvim-autopairs.lua".source = ../nvim/lua/plugins/nvim-autopairs.lua;
    xdg.configFile."nvim/lua/plugins/treesitter-context.lua".source = ../nvim/lua/plugins/treesitter-context.lua;
    xdg.configFile."nvim/lua/plugins/rainbow-delimiters.lua".source = ../nvim/lua/plugins/rainbow-delimiters.lua;
    xdg.configFile."nvim/lua/plugins/satellite.lua".source = ../nvim/lua/plugins/satellite.lua;
    xdg.configFile."nvim/lua/plugins/smear-cursor.lua".source = ../nvim/lua/plugins/smear-cursor.lua;
    xdg.configFile."nvim/lua/plugins/smart-splits.lua".source = ../nvim/lua/plugins/smart-splits.lua;
    xdg.configFile."nvim/lua/plugins/tiny-inline-diagnostic.lua".source = ../nvim/lua/plugins/tiny-inline-diagnostic.lua;
    xdg.configFile."nvim/lua/plugins/trouble.lua".source = ../nvim/lua/plugins/trouble.lua;
    xdg.configFile."nvim/lua/plugins/ts-autotag.lua".source = ../nvim/lua/plugins/ts-autotag.lua;
    xdg.configFile."nvim/lua/plugins/ts-context-commentstring.lua".source = ../nvim/lua/plugins/ts-context-commentstring.lua;
    xdg.configFile."nvim/lua/plugins/undo-glow.lua".source = ../nvim/lua/plugins/undo-glow.lua;
    xdg.configFile."nvim/lua/plugins/treesj.lua".source = ../nvim/lua/plugins/treesj.lua;
    xdg.configFile."nvim/lua/plugins/treesitter.lua".source = ../nvim/lua/plugins/treesitter.lua;
    xdg.configFile."nvim/lua/plugins/everforest.lua".source = ../nvim/lua/plugins/everforest.lua;
    xdg.configFile."nvim/lua/plugins/flash.lua".source = ../nvim/lua/plugins/flash.lua;

    xdg.configFile."nvim/lua/shared/diagnostic_icons.lua".source = ../nvim/lua/shared/diagnostic_icons.lua;
    xdg.configFile."nvim/lua/shared/float.lua".source = ../nvim/lua/shared/float.lua;
    xdg.configFile."nvim/lua/ui/diagnostic_icons.lua".source = ../nvim/lua/ui/diagnostic_icons.lua;
    xdg.configFile."nvim/lua/ui/cursor_mode.lua".source = ../nvim/lua/ui/cursor_mode.lua;
    xdg.configFile."nvim/lua/config/mini/ai.lua".source = ../nvim/lua/config/mini/ai.lua;
    xdg.configFile."nvim/lua/config/mini/align.lua".source = ../nvim/lua/config/mini/align.lua;
    xdg.configFile."nvim/lua/config/mini/clue.lua".source = ../nvim/lua/config/mini/clue.lua;
    xdg.configFile."nvim/lua/config/mini/cursorword.lua".source = ../nvim/lua/config/mini/cursorword.lua;
    xdg.configFile."nvim/lua/config/mini/files.lua".source = ../nvim/lua/config/mini/files.lua;
    xdg.configFile."nvim/lua/config/mini/hipatterns.lua".source = ../nvim/lua/config/mini/hipatterns.lua;
    xdg.configFile."nvim/lua/config/mini/misc.lua".source = ../nvim/lua/config/mini/misc.lua;
    xdg.configFile."nvim/lua/config/mini/move.lua".source = ../nvim/lua/config/mini/move.lua;
    xdg.configFile."nvim/lua/config/mini/operators.lua".source = ../nvim/lua/config/mini/operators.lua;
    xdg.configFile."nvim/lua/config/mini/pick.lua".source = ../nvim/lua/config/mini/pick.lua;
    xdg.configFile."nvim/lua/config/mini/sessions.lua".source = ../nvim/lua/config/mini/sessions.lua;
    xdg.configFile."nvim/lua/config/mini/starter.lua".source = ../nvim/lua/config/mini/starter.lua;
    xdg.configFile."nvim/lua/config/mini/surround.lua".source = ../nvim/lua/config/mini/surround.lua;
    xdg.configFile."nvim/lua/config/mini/visits.lua".source = ../nvim/lua/config/mini/visits.lua;
    xdg.configFile."nvim/lua/config/submode/window.lua".source = ../nvim/lua/config/submode/window.lua;
    xdg.configFile."nvim/lua/config/submode/debug.lua".source = ../nvim/lua/config/submode/debug.lua;
    xdg.configFile."nvim/lua/config/submode/shared.lua".source = ../nvim/lua/config/submode/shared.lua;

    home.file.".config/nvim/lua/nix_paths.lua".source = nixPathsLua;
  }
