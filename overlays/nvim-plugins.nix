final: prev: {
  vimPlugins = prev.vimPlugins // {
    neodim = prev.vimUtils.buildVimPlugin {
      pname = "neodim";
      version = "unstable-2026-03-24";
      src = prev.fetchFromGitHub {
        owner = "zbirenbaum";
        repo = "neodim";
        rev = "1b8bda59a53b49ec2b59885e9fe78f8e90a1de76";
        hash = "sha256-1d4z1wdlb1g4h7ml4h82bv4fs9p0n8fxf0aq0bmr5acgpp29i43q";
      };
    };

    neotab-nvim = prev.vimUtils.buildVimPlugin {
      pname = "neotab.nvim";
      version = "unstable-2026-03-24";
      src = prev.fetchFromGitHub {
        owner = "kawre";
        repo = "neotab.nvim";
        rev = "e99d3e28c5a2066d2d368dfe4ef3827c8d75d337";
        hash = "sha256-048s9ria6v1yvwvd7vzbv5309rjhrrs9j62hmi85i2wzmajfy8m5";
      };
    };

    wisteria-nvim = prev.vimUtils.buildVimPlugin {
      pname = "wisteria.nvim";
      version = "unstable-2026-03-24";
      src = prev.fetchFromGitHub {
        owner = "masisz";
        repo = "wisteria.nvim";
        rev = "9d2ff53f31b8a17de82531ea2376e258ad500f4d";
        hash = "sha256-BfsQuGPRBBqn/GNF7c51ntCHefLtRDywKRT7h3pvkwo=";
      };
    };
  };
}
