local nix = require("nix_paths")

return {
  name = "fidget.nvim",
  dir = nix.fidget,
  event = "LspAttach",
  opts = {
    progress = {
      display = {
        progress_ttl = 10,
        done_ttl = 3,
      },
    },
    notification = {
      override_vim_notify = false,
      window = {
        normal_hl = "Normal",
        winblend = 0,
      },
    },
  },
}
