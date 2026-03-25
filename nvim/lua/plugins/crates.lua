local nix = require("nix_paths")

return {
  dir = nix.crates,
  event = { "BufRead Crates.toml" },
  opts = {},
}
