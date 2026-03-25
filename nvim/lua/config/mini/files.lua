return function()
  require("mini.files").setup()

  vim.keymap.set("n", "<leader>f", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  end, { noremap = true, silent = true, desc = "Mini files" })
end
