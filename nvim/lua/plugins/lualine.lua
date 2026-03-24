local nix = require("nix_paths")

return {
  name = "lualine.nvim",
  dir = nix.lualine,
  event = "VeryLazy",
  dependencies = {
    "mini.icons",
  },
  opts = {
    options = {
      theme = "everforest",
    },
  },
}
