local nix = require("nix_paths")

return {
  name = "nvim-bqf",
  dir = nix.bqf,
  ft = "qf",
  opts = {
    func_map = {
      stoggledown = "]s",
      stoggleup = "[s",
      stogglevm = "gs",
      stogglebuf = "gS",
      sclear = "zS",
    },
  },
}
