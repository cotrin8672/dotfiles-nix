local nix = require("nix_paths")

return {
  name = "mini.nvim",
  dir = nix.mini_nvim,
  event = "VeryLazy",
  config = function()
    local map = require("mini.map")

    map.setup()
    map.open()
  end,
}
