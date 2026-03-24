local nix = require("nix_paths")

return {
  name = "nvim-autopairs",
  dir = nix.nvim_autopairs,
  event = "InsertEnter",
  opts = {},
}
