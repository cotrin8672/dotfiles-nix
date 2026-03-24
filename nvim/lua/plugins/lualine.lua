local nix = require("nix_paths")

return {
  name = "lualine.nvim",
  dir = nix.lualine,
  event = "VeryLazy",
  dependencies = {
    "mini.icons",
  },
  config = function()
    local ok_sm, sm = pcall(require, "nvim-submode")
    local mode = require("lualine.utils.mode")
    local ok, icons = pcall(require, "ui.diagnostic_icons")
    if not ok then
      icons = require("shared.diagnostic_icons")
    end

    local function submode_label()
      if ok_sm then
        local name = sm.get_submode_name()
        if name and name ~= "" then
          return name
        end
      end
      return mode.get_mode()
    end

    local function submode_color()
      if ok_sm then
        return sm.get_submode_color()
      end
      return nil
    end

    local function submode_bg()
      return { bg = submode_color() }
    end

    local function submode_fg()
      return { fg = submode_color() }
    end

    local function lsp_status()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then
        return "no-lsp"
      end
      local status = vim.lsp.status()
      if status and status ~= "" then
        return status
      end
      local names = {}
      for _, client in ipairs(clients) do
        names[#names + 1] = client.name
      end
      return table.concat(names, ",")
    end

    require("lualine").setup({
      options = {
        theme = "everforest",
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "ministarter" },
        },
      },
      sections = {
        lualine_a = {
          { submode_label, color = submode_bg, separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
        },
        lualine_b = {
          { "branch", icon = "", color = submode_fg, separator = "", padding = { left = 1, right = 1 } },
          { function() return "" end, color = submode_fg, separator = "", padding = { left = 0, right = 0 } },
          {
            function()
              return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            end,
            icon = "󰉋",
            color = submode_fg,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = icons.error_icon,
              warn = icons.warn_icon,
              info = icons.info_icon,
              hint = icons.hint_icon,
            },
            color = submode_fg,
            separator = "",
            padding = { left = 1, right = 1 },
          },
          { function() return "" end, color = submode_fg, separator = "", padding = { left = 0, right = 0 } },
          { lsp_status, icon = "", color = submode_fg, separator = "", padding = { left = 1, right = 1 } },
          { function() return "" end, color = submode_fg, separator = "", padding = { left = 0, right = 0 } },
          { "filetype", icon_only = false, icon = { align = "left" }, color = submode_fg, separator = "", padding = { left = 1, right = 1 } },
          { function() return "" end, color = submode_fg, separator = "", padding = { left = 0, right = 0 } },
          { "progress", color = submode_fg, separator = "", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          { "location", color = submode_bg, separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
        },
      },
    })
  end,
}
