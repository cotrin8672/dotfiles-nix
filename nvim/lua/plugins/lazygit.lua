local nix = require("nix_paths")

return {
  {
    name = "plenary.nvim",
    dir = nix.plenary,
    lazy = true,
  },
  {
    name = "lazygit.nvim",
    dir = nix.lazygit_nvim,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "plenary.nvim",
    },
    keys = {
      {
        "<leader>gg",
        "<cmd>LazyGit<cr>",
        desc = "LazyGit",
      },
    },
  },
}
