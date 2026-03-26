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
  end,
}
