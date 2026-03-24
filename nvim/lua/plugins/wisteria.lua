local nix = require("nix_paths")

return {
  name = "wisteria.nvim",
  dir = nix.wisteria,
  lazy = false,
  priority = 1000,
  config = function()
    require("wisteria").setup({
      transparent = true,
      overrides = function()
        return {}
      end,
    })

    vim.cmd.colorscheme("wisteria")
  end,
}
