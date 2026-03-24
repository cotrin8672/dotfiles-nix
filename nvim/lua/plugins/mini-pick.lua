local nix = require("nix_paths")

return {
  name = "mini.nvim",
  dir = nix.mini_nvim,
  event = "VeryLazy",
  config = function()
    require("mini.pick").setup()

    vim.keymap.set("n", "<leader>pf", function()
      MiniPick.builtin.files()
    end, { noremap = true, silent = true, desc = "Pick files" })
  end,
}
