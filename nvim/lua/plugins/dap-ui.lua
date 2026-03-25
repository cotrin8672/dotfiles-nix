local nix = require("nix_paths")

return {
  name = "nvim-dap-ui",
  dir = nix.nvim_dap_ui,
  event = "VeryLazy",
  dependencies = {
    {
      name = "nvim-dap",
      dir = nix.nvim_dap,
    },
    {
      name = "nvim-nio",
      dir = nix.nio,
    },
  },
  config = function()
    require("dapui").setup()
  end,
}
