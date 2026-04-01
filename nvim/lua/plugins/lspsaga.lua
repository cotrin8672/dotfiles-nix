local nix = require("nix_paths")

return {
  name = "lspsaga.nvim",
  dir = nix.lspsaga,
  event = "LspAttach",
  keys = {
    {
      "<leader>ca",
      "<cmd>Lspsaga code_action<cr>",
      mode = "n",
      desc = "LSP Code Action",
    },
  },
  dependencies = {
    {
      name = "nvim-treesitter",
      dir = nix.treesitter,
    },
    {
      name = "nvim-web-devicons",
      dir = nix.nvim_web_devicons,
    },
  },
  opts = {
    lightbulb = {
      enable = false,
    },
  },
}
