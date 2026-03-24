local nix = require("nix_paths")

return {
  name = "oil.nvim",
  dir = nix.oil,
  cmd = "Oil",
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Oil: Parent dir" },
    { "<leader>e", "<cmd>Oil --float<cr>", desc = "Oil: Float" },
    { "<leader>O", "<cmd>Oil<cr>", desc = "Oil: CWD" },
  },
  opts = {
    default_file_explorer = true,
    win_options = {
      signcolumn = "yes:2",
    },
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-h>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["-"] = "actions.parent",
      ["g."] = "actions.toggle_hidden",
      ["q"] = "actions.close",
    },
  },
  dependencies = {
    {
      name = "nvim-web-devicons",
      dir = nix.nvim_web_devicons,
    },
  },
}
