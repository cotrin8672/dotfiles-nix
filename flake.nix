{
  description = "base flake";

  inputs = {
    nixos-wsl.url = "github:nix-community/NixOS-WSL/release-25.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs = {self, nixpkgs, nixos-wsl, home-manager, llm-agents, ...}:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        nixos-wsl.nixosModules.default
        home-manager.nixosModules.home-manager
        ./configuration.nix

        {
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
