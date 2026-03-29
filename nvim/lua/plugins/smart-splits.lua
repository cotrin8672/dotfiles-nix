local nix = require("nix_paths")

return {
  name = "smart-splits.nvim",
  dir = nix.smart_splits,
  lazy = false,
  opts = {
    default_amount = 3,
    at_edge = "stop",
    wezterm_cli_path = "/mnt/c/Users/gummy/scoop/apps/wezterm-nightly/nightly-20260130/wezterm.exe",
  },
  config = function(_, opts)
    local smart_splits = require("smart-splits")

    smart_splits.setup(opts)

    vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left, { desc = "Move to left split", silent = true })
    vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down, { desc = "Move to lower split", silent = true })
    vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up, { desc = "Move to upper split", silent = true })
    vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right, { desc = "Move to right split", silent = true })
  end,
}
