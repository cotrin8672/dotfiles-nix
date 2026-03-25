local nix = require("nix_paths")

return {
  name = "crates.nvim",
  dir = nix.crates,
  event = { "BufRead Crates.toml" },
  opts = {},
}
