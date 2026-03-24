local nix = require("nix_paths")

return {
  name = "lsp_signature.nvim",
  dir = nix.lsp_signature,
  event = "LspAttach",
  opts = {
    hint_enable = false,
    floating_window = true,
    handler_opts = {
      border = "rounded",
    },
  },
}
