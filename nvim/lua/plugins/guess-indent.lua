local nix = require("nix_paths")

return {
  name = "guess-indent.nvim",
  dir = nix.guess_indent,
  event = { "BufReadPost", "BufNewFile" },
}
