local nix = require("nix_paths")

return {
  name = "mini.nvim",
  dir = nix.mini_nvim,
  event = "VeryLazy",
  config = function()
    require("mini.animate").setup({
      cursor = { enable = false },
      scroll = { enable = true },
      resize = { enable = false },
      open = { enable = false },
      close = { enable = false },
    })
  end,
}
