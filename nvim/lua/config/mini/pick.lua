return function()
  require("mini.pick").setup()

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "MiniPickNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "MiniPickPrompt", { bg = "none" })
      vim.api.nvim_set_hl(0, "MiniPickPreviewLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    end,
  })

  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = vim.g.colors_name })

  vim.keymap.set("n", "<leader>pf", function()
    MiniPick.builtin.files()
  end, { noremap = true, silent = true, desc = "Pick files" })
end
