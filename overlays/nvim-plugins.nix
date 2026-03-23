final: prev: {
  vimPlugins = prev.vimPlugins // {
    wisteria-nvim = prev.vimUtils.buildVimPlugin {
      pname = "wisteria.nvim";
      version = "unstable-2026-03-24";
      src = prev.fetchFromGitHub {
        owner = "masisz";
        repo = "wisteria.nvim";
        rev = "main";
        hash = "sha256-9d2ff53f31b8a17de82531ea2376e258ad500f4d=";
      };
    };
  };
}
