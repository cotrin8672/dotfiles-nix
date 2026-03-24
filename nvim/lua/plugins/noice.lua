local nix = require("nix_paths")

return {
  name = "noice.nvim",
  dir = nix.noice,
  event = "VeryLazy",
  dependencies = {
    {
      name = "nui.nvim",
      dir = nix.nui,
    },
    {
      name = "nvim-notify",
      dir = nix.nvim_notify,
    },
  },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  },
  config = function(_, opts)
    local ok_notify, notify = pcall(require, "notify")
    if ok_notify then
      notify.setup({
        background_colour = "#000000",
      })
      vim.notify = notify
    end

    require("noice").setup(opts)
  end,
}
