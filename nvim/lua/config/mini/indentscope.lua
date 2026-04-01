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

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "ministarter",
    callback = function(args)
      vim.b[args.buf].miniindentscope_disable = true
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniStarterOpened",
    callback = function(args)
      local buf = args.buf or vim.api.nvim_get_current_buf()
      vim.b[buf].miniindentscope_disable = true
      pcall(function()
        require("mini.indentscope").undraw()
      end)
    end,
  })
end
