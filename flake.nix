{
  description = "icedcoffeeee's nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    quickshell.url = "github:outfoxxed/quickshell";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.inputs.quickshell.follows = "quickshell";

    zen.url = "github:0xc000022070/zen-browser-flake";
    zen.inputs.nixpkgs.follows = "nixpkgs";
    zen.inputs.home-manager.follows = "home-manager";

    sunsetr.url = "github:psi4j/sunsetr";
    sunsetr.inputs.nixpkgs.follows = "nixpkgs";

    dolphin.url = "github:rumboon/dolphin-overlay";
    dolphin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    let
      user = "icedtea";
      host = "nixos";
      system = "x86_64-linux";
    in {
      nixosConfigurations.${host} = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs user host; };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          inputs.noctalia.nixosModules.default
          ./system

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs user host; };
            };

            home-manager.users.${user} = {
              home.stateVersion = "25.05";

              imports = [
                inputs.nixvim.homeManagerModules.nixvim
                inputs.noctalia.homeModules.default
                ./home
              ];
            };
          }
        ];
      };
    };
}
