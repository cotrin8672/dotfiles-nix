local nix = require("nix_paths")

return {
  dir = nix.flash,
  event = "VeryLazy",
  opts = {
    modes = {
      char = { enabled = false },
      search = { enabled = false },
      treesitter = { enabled = false },
    },
  },
  keys = {
    {
      "<CR>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          label = { before = true, after = false },
        })
      end,
      desc = "Flash",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
  },
}
