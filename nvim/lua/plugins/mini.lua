local nix = require("nix_paths")

return {
  name = "mini.nvim",
  dir = nix.mini_nvim,
  event = "VeryLazy",
  config = function()
    require("config.mini.pick")()
  end,
}
