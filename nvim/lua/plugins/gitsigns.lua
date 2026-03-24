local nix = require("nix_paths")

return {
  name = "gitsigns.nvim",
  dir = nix.gitsigns,
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
