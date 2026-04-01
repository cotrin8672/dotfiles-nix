return function()
  require("mini.indentscope").setup({
    symbol = "│",
    draw = {
      delay = 0,
      animation = function()
        return 0
      end,
    },
    options = {
      try_as_border = true,
    },
  })

  vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "LineNr" })
  vim.api.nvim_set_hl(0, "MiniIndentscopePrefix", { nocombine = true })
end
