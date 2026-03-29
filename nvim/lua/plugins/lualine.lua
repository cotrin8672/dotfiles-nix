local nix = require("nix_paths")

return {
  name = "lualine.nvim",
  dir = nix.lualine,
  event = "VeryLazy",
  dependencies = {
    "mini.icons",
  },
  config = function()
    local everforest = require("everforest")
    local colours = require("everforest.colours")
    local sm = require("nvim-submode")
    local mode = require("lualine.utils.mode")
    local palette = colours.generate_palette(everforest.config, vim.o.background)

    local theme = {
      normal = {
        a = { bg = palette.green, fg = palette.bg0, gui = "bold" },
        b = { bg = palette.bg3, fg = palette.fg },
        c = { bg = palette.bg5, fg = palette.fg },
      },
      insert = {
        a = { bg = palette.fg, fg = palette.bg0, gui = "bold" },
        b = { bg = palette.bg3, fg = palette.fg },
        c = { bg = palette.bg5, fg = palette.fg },
      },
      visual = {
        a = { bg = palette.red, fg = palette.bg0, gui = "bold" },
        b = { bg = palette.bg3, fg = palette.fg },
        c = { bg = palette.bg5, fg = palette.fg },
      },
      replace = {
        a = { bg = palette.orange, fg = palette.bg0, gui = "bold" },
        b = { bg = palette.bg3, fg = palette.fg },
        c = { bg = palette.bg5, fg = palette.fg },
      },
      command = {
        a = { bg = palette.aqua, fg = palette.bg0, gui = "bold" },
        b = { bg = palette.bg3, fg = palette.fg },
        c = { bg = palette.bg5, fg = palette.fg },
      },
      terminal = {
        a = { bg = palette.purple, fg = palette.bg0, gui = "bold" },
        b = { bg = palette.bg3, fg = palette.fg },
        c = { bg = palette.bg5, fg = palette.fg },
      },
      inactive = {
        a = { bg = palette.bg5, fg = palette.grey1, gui = "bold" },
        b = { bg = palette.bg5, fg = palette.grey1 },
        c = { bg = palette.bg5, fg = palette.grey1 },
      },
    }

    local function submode_label()
      local name = sm.get_submode_name()
      if name and name ~= "" then
        return name
      end
      return mode.get_mode()
    end

    local function repo_name()
      local path = vim.api.nvim_buf_get_name(0)
      if path == "" then
        path = vim.loop.cwd()
      else
        path = vim.fs.dirname(path)
      end

      local git_dir = vim.fs.find(".git", { path = path, upward = true })[1]
      if not git_dir then
        return ""
      end

      return vim.fs.basename(vim.fs.dirname(git_dir))
    end

    local function submode_bg()
      local color = sm.get_submode_color()
      if color and color ~= "" then
        return { bg = color }
      end
      return nil
    end

    local function submode_fg()
      local color = sm.get_submode_color()
      if color and color ~= "" then
        return { fg = color }
      end
      return nil
    end

    require("lualine").setup({
      options = {
        theme = theme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "╲", right = "╲" },
        disabled_filetypes = {
          statusline = { "ministarter" },
          winbar = { "ministarter" },
        },
      },
      sections = {
        lualine_a = {
          {
            submode_label,
            color = submode_bg,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          {
            repo_name,
            icon = "󰉋",
            separator = { left = "", right = "" },
          },
          {
            "branch",
            icon = "",
            color = { bg = palette.bg5, fg = palette.fg },
          },
        },
        lualine_c = {},
        lualine_x = {
          {
            "lsp_status",
            color = { bg = palette.bg5, fg = palette.fg },
          },
        },
        lualine_y = {
          {
            "filetype",
            color = { bg = palette.bg3, fg = palette.fg },
          },
        },
        lualine_z = {
          {
            "location",
            color = submode_bg,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
      },
    })
  end,
}
