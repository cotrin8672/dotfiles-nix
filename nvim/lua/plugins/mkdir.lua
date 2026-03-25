local nix = require("nix_paths")

return {
  name = "mkdir.nvim",
  dir = nix.mkdir,
  event = "BufWritePre",
}
