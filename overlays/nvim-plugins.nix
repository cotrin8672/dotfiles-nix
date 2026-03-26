final: prev: {
  vimPlugins = prev.vimPlugins // {
    vim-edgemotion = prev.vimUtils.buildVimPlugin {
      pname = "vim-edgemotion";
      version = "unstable-2026-03-24";
      src = prev.fetchFromGitHub {
        owner = "haya14busa";
        repo = "vim-edgemotion";
        rev = "8d16bd92f6203dfe44157d43be7880f34fd5c060";
        sha256 = "1w3nqkw7k2ryrw1rckj27a0jbjnvgc6fb7871fhb4ba2mpxd8l08";
      };
    };

    neodim = prev.vimUtils.buildVimPlugin {
      pname = "neodim";
      version = "unstable-2026-03-24";
      src = prev.fetchFromGitHub {
        owner = "zbirenbaum";
        repo = "neodim";
        rev = "1b8bda59a53b49ec2b59885e9fe78f8e90a1de76";
        sha256 = "1d4z1wdlb1g4h7ml4h82bv4fs9p0n8fxf0aq0bmr5acgpp29i43q";
      };
    };

    neotab-nvim = prev.vimUtils.buildVimPlugin {
      pname = "neotab.nvim";
      version = "unstable-2026-03-24";
      src = prev.fetchFromGitHub {
        owner = "kawre";
        repo = "neotab.nvim";
        rev = "e99d3e28c5a2066d2d368dfe4ef3827c8d75d337";
        sha256 = "048s9ria6v1yvwvd7vzbv5309rjhrrs9j62hmi85i2wzmajfy8m5";
      };
    };

    nvim-nio = prev.vimUtils.buildVimPlugin {
      pname = "nvim-nio";
      version = "unstable-2026-03-25";
      src = prev.fetchFromGitHub {
        owner = "nvim-neotest";
        repo = "nvim-nio";
        rev = "a428f309119086dc78dd4b19306d2d67be884eee";
        hash = "sha256-i6imNTb1xrfBlaeOyxyIwAZ/+o6ew9C4/z34a7/BgFg=";
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

    everforest-nvim = prev.vimUtils.buildVimPlugin {
      pname = "everforest-nvim";
      version = "unstable-2026-03-26";
      src = prev.fetchFromGitHub {
        owner = "neanias";
        repo = "everforest-nvim";
        rev = "323e7633034a8068636a11597cec03bca5465c50";
        sha256 = "15qa2lxdhi9hc253kllcv0x4c32bcwfk51dabqk5h8l2bl96jxix";
      };
    };
  };
}
