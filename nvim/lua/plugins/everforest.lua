local nix = require("nix_paths")

return {
  name = "everforest",
  dir = nix.everforest,
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = "medium"
    vim.g.everforest_enable_italic = false
    vim.g.everforest_transparent_background = 1
    vim.cmd.colorscheme("everforest")
  end,
}
