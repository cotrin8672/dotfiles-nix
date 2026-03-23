require("wisteria").setup({
  transparent = true,
  overrides = function(colors)
    return {}
  end,
})

vim.cmd.colorscheme("wisteria")

