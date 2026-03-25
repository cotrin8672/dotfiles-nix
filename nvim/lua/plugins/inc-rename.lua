local nix = require("nix_paths")

return {
  dir = nix.inc_rename,
  event = "LspAttach",
  opts = {},
}
