local nix = require("nix_paths")

return {
  name = "everforest",
  dir = nix.everforest,
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = "medium"
    vim.g.everforest_enable_italic = true
    vim.cmd.colorscheme("everforest")
  end,
}
