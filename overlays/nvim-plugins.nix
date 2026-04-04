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

    nvim-treesitter = prev.vimUtils.buildVimPlugin {
      pname = "nvim-treesitter";
      version = "0.10.0-unstable-2026-04-03";
      src = prev.fetchFromGitHub {
        owner = "nvim-treesitter";
        repo = "nvim-treesitter";
        rev = "4916d6592ede8c07973490d9322f187e07dfefac";
        hash = "sha256-PQR6tFt4lCrAZNQG7BLMD1IiCKja9wDS1S4laGJf/HE=";
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

    nvim-submode = prev.vimUtils.buildVimPlugin {
      pname = "nvim-submode";
      version = "unstable-2026-03-26";
      src = prev.fetchFromGitHub {
        owner = "sirasagi62";
        repo = "nvim-submode";
        rev = "ec53f878dcfd52a824ec199dfb5af8e07c98fd5c";
        sha256 = "1ixzwh921b8hagj7n6nspy78fcvd3nv5h85sk0sx75lljrsq0hcj";
      };
    };

    undo-glow-nvim = prev.vimUtils.buildVimPlugin {
      pname = "undo-glow.nvim";
      version = "unstable-2026-03-27";
      src = prev.fetchFromGitHub {
        owner = "y3owk1n";
        repo = "undo-glow.nvim";
        rev = "25314a94cdfd84a3ca62bada1f88ed00982659ac";
        sha256 = "087k1s61wli2ki3fxf43pkqgffy6hxfbhs2alzg2jvyqf76vv1jj";
      };
    };

    kotlin-nvim = prev.vimUtils.buildVimPlugin {
      pname = "kotlin.nvim";
      version = "unstable-2026-03-31";
      src = prev.fetchFromGitHub {
        owner = "AlexandrosAlexiou";
        repo = "kotlin.nvim";
        rev = "262340932602a77ce0be12aab949864a37a756bc";
        hash = "sha256-SyYeGwFWCX1zNVV5muzxC6Y3Y6I9V67CNlyEldwj4ck=";
      };
    };
  };
}
