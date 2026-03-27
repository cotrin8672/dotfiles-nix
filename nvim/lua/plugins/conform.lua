local nix = require("nix_paths")

return {
  name = "conform.nvim",
  dir = nix.conform,
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "alejandra" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
      rust = { "rustfmt" },
      toml = { "taplo" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
