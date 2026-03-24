local nix = require("nix_paths")

return {
  name = "blink.cmp",
  dir = nix.blink_cmp,
  event = "InsertEnter",
  config = function()
    require("blink.cmp").setup({
      keymap = {
        preset = "enter",
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = false,
        },
      },
      sources = {
        default = {
          "buffer",
          "path",
          "lsp",
        },
      },
    })
  end,
}

