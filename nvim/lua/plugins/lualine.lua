local nix = require("nix_paths")

return {
  name = "lualine.nvim",
  dir = nix.lualine,
  event = "VeryLazy",
  dependencies = {
    "mini.icons",
  },
  config = function()
    local sm = require("nvim-submode")
    local mode = require("lualine.utils.mode")

    local function submode_label()
      local name = sm.get_submode_name()
      if name and name ~= "" then
        return name
      end
      return mode.get_mode()
    end

    local function submode_bg()
      local color = sm.get_submode_color()
      if color and color ~= "" then
        return { bg = color }
      end
      return nil
    end

    require("lualine").setup({
      options = {
        theme = "everforest",
        disabled_filetypes = {
          statusline = { "ministarter" },
          winbar = { "ministarter" },
        },
      },
      sections = {
        lualine_a = {
          { submode_label, color = submode_bg },
        },
      },
    })
  end,
}
