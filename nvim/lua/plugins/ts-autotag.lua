local nix = require("nix_paths")

return {
  name = "nvim-ts-autotag",
  dir = nix.nvim_ts_autotag,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      name = "nvim-treesitter",
      dir = nix.treesitter,
    },
  },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    })
  end,
}
