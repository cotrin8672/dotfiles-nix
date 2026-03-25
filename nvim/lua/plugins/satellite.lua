local nix = require("nix_paths")

return {
  name = "satellite.nvim",
  dir = nix.satellite,
  event = "VeryLazy",
  opts = {
    current_only = false,
    winblend = 0,
    zindex = 40,
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "neo-tree",
      "oil",
    },
    handlers = {
      search = { enable = true },
      diagnostic = { enable = true },
      gitsigns = { enable = false },
      cursor = { enable = false },
    },
  },
}
