local nix = require("nix_paths")

return {
  name = "oil-git-status.nvim",
  dir = nix.oil_git_status,
  dependencies = {
    {
      name = "oil.nvim",
      dir = nix.oil,
    },
  },
  event = "VeryLazy",
  config = function()
    require("oil-git-status").setup()
  end,
}
