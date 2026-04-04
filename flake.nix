{
  description = "base flake";

  inputs = {
    nixos-wsl.url = "github:nix-community/NixOS-WSL/release-25.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs = {nixpkgs, nixos-wsl, home-manager, llm-agents, ...} :
  let
    system = "x86_64-linux";
    overlays = [
      (import ./overlays/packages.nix)
      (import ./overlays/nvim-plugins.nix)
    ];
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        nixos-wsl.nixosModules.default
        home-manager.nixosModules.home-manager
        ./configuration.nix

        {
	  nixpkgs.overlays = overlays;

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.extraSpecialArgs = {
            inherit llm-agents;
          };

          home-manager.users.cotrin = import ./home/default.nix;
        }
      ];
    };
  };
}
