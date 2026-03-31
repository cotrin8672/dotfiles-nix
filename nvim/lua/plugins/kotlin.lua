local nix = require("nix_paths")

return {
  name = "kotlin.nvim",
  dir = nix.kotlin_nvim,
  ft = { "kotlin" },
  dependencies = {
    {
      name = "nvim-lspconfig",
      dir = nix.lspconfig,
    },
    {
      name = "oil.nvim",
      dir = nix.oil,
    },
    {
      name = "trouble.nvim",
      dir = nix.trouble,
    },
  },
  config = function()
    require("kotlin").setup({
      root_markers = {
        "gradlew",
        ".git",
        "mvnw",
        "settings.gradle",
        "settings.gradle.kts",
      },
      jre_path = os.getenv("JAVA_HOME"),
      jdk_for_symbol_resolution = os.getenv("JDK_FOR_SYMBOL_RESOLUTION") or os.getenv("JAVA_HOME"),
      jvm_args = {
        "-Xmx4g",
      },
      inlay_hints = {
        enabled = true,
      },
    })
  end,
}
