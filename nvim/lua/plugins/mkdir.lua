local nix = require("nix_paths")

return {
  dir = nix.mkdir,
  event = "BufWritePre",
}
