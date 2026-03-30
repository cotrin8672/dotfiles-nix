local nix = require("nix_paths")

return {
  name = "nvim-treesitter-endwise",
  dir = nix.nvim_treesitter_endwise,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      name = "nvim-treesitter",
      dir = nix.treesitter,
    },
  },
}
