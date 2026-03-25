local nix = require("nix_paths")

return {
  name = "mini.extra",
  dir = nix.mini_extra,
  lazy = true,
  config = function()
    require("mini.extra").setup()
  end,
}
