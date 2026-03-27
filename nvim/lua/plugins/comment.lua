local nix = require("nix_paths")

return {
  name = "Comment.nvim",
  dir = nix.comment,
  event = "VeryLazy",
  dependencies = {
    {
      name = "nvim-ts-context-commentstring",
      dir = nix.ts_context_commentstring,
    },
  },
  config = function()
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
