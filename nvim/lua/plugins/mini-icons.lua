local nix = require("nix_paths")

return {
  name = "mini.icons",
  dir = nix.mini_icons,
  lazy = true,
  config = function()
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
}
