local nix = require("nix_paths")

return {
  name = "nvim-ts-context-commentstring",
  dir = nix.ts_context_commentstring,
  event = "VeryLazy",
  config = function()
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })
  end,
}
