local nix = require("nix_paths")
local float = require("shared.float")

return {
  name = "toggleterm.nvim",
  dir = nix.toggleterm,
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = nil,
      shade_terminals = false,
      direction = "float",
      float_opts = {
        border = "curved",
        width = math.floor(vim.o.columns * 0.88),
        height = math.floor(vim.o.lines * 0.88),
        winblend = float.blend,
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "curved",
        width = math.floor(vim.o.columns * 0.88),
        height = math.floor(vim.o.lines * 0.88),
        winblend = float.blend,
      },
    })

    vim.keymap.set("n", "<leader>f", function()
      lazygit:toggle()
    end, { desc = "LazyGit Float" })
  end,
}
