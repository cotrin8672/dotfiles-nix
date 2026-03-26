local nix = require("nix_paths")

return {
  name = "nvim-submode",
  dir = nix.nvim_submode,
  event = "VeryLazy",
  config = function()
    local sm = require("nvim-submode")

    require("config.submode.window")(sm)
    require("config.submode.debug")(sm)
  end,
}
