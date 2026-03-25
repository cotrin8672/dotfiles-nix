local nix = require("nix_paths")

return {
  name = "neoscroll.nvim",
  dir = nix.neoscroll,
  event = "VeryLazy",
  opts = {},
}
