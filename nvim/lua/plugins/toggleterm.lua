local nix = require("nix_paths")
local float = require("shared.float")

return {
  name = "toggleterm.nvim",
  dir = nix.toggleterm,
  version = "*",
  config = function()
    local normal_float = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
    local float_border = vim.api.nvim_get_hl(0, { name = "FloatBorder", link = false })

    vim.api.nvim_set_hl(0, "ToggleTermNormal", {
      bg = normal_float.bg,
      fg = normal_float.fg,
    })
    vim.api.nvim_set_hl(0, "ToggleTermBorder", {
      bg = float_border.bg,
      fg = float_border.fg,
    })

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

    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
  end,
}
