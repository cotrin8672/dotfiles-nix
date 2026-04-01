local nix = require("nix_paths")

return {
  name = "everforest",
  dir = nix.everforest,
  lazy = false,
  priority = 1000,
  config = function()
    require("everforest").setup({
      background = "hard",
      italics = false,
      transparent_background_level = 2,
    })
    vim.cmd.colorscheme("everforest")

    local colours = require("everforest.colours")
    local palette = colours.generate_palette(require("everforest").config, vim.o.background)
    vim.api.nvim_set_hl(0, "LineNr", { fg = palette.bg3 })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = palette.bg3 })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = palette.bg3 })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.bg3 })
    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = palette.bg3 })
  end,
}
