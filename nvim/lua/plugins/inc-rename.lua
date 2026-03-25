local nix = require("nix_paths")

return {
  name = "inc-rename.nvim",
  dir = nix.inc_rename,
  event = "LspAttach",
  opts = {},
}
