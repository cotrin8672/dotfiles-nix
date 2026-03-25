local nix = require("nix_paths")

return {
  name = "nvim-dap-virtual-text",
  dir = nix.nvim_dap_virtual_text,
  event = "VeryLazy",
  dependencies = {
    {
      name = "nvim-dap",
      dir = nix.nvim_dap,
    },
  },
  opts = {},
}
