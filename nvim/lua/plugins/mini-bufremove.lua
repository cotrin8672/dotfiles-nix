local nix = require("nix_paths")

return {
  name = "mini.bufremove",
  dir = nix.mini_bufremove,
  event = "VeryLazy",
  config = function()
    require("mini.bufremove").setup()
  end,
}
