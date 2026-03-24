local nix = require("nix_paths")

return {
  name = "highlight-undo.nvim",
  dir = nix.highlight_undo,
  event = { "VeryLazy" },
  opts = {
    duration = 300,
  },
}
