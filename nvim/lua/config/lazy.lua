vim.opt.rtp:prepend("@lazy_nvim@")

require("lazy").setup({
  {
    name = "nvim-treesitter",
    dir = "@treesitter@",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.treesitter")
    end,
  },
  {
    name = "blink.cmp",
    dir = "@blink_cmp@",
    event = "InsertEnter",
    config = function()
      require("plugins.blink")
    end,
  },
  {
    name = "nvim-lspconfig",
    dir = "@lspconfig@",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.lsp")
    end,
  },
}, {
  install = { missing = false },
  checker = { enabled = false },
  change_detection = { enabled = false },
})

