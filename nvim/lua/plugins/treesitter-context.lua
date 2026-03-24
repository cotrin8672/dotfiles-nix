local nix = require("nix_paths")

return {
  name = "nvim-treesitter-context",
  dir = nix.nvim_treesitter_context,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      name = "nvim-treesitter",
      dir = nix.treesitter,
    },
  },
  opts = {
    max_lines = 3,
  },
}
