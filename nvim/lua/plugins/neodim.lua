local nix = require("nix_paths")

return {
  name = "neodim",
  dir = nix.neodim,
  event = "LspAttach",
  opts = {},
}
