local nix = require("nix_paths")

return {
  name = "nvim-treesitter",
  dir = nix.treesitter,
  lazy = false,
  priority = 1000,
  config = function()
    for _, path in ipairs(nix.treesitter_parsers or {}) do
      vim.opt.rtp:append(path)
    end

    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {},
      auto_install = false,
    })
  end,
}
