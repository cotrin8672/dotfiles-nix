local nix = require("nix_paths")
local float = require("shared.float")

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
        menu = {
          winblend = float.blend,
        },
        documentation = {
          auto_show = false,
          window = {
            winblend = float.blend,
          },
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
