local nix = require("nix_paths")

return {
  name = "mini.nvim",
  dir = nix.mini_nvim,
  event = "VeryLazy",
  config = function()
    require("config.mini.animate")()
    require("config.mini.map")()
    require("config.mini.pick")()
  end,
}
