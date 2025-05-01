{
  description = "icedtea's nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flatpak.url = "github:gmodena/nix-flatpak";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, nixvim, home-manager, ... } @ inputs: let
    inherit (self) outputs;

    system = "x86_64-linux";
    home   = home-manager.nixosModules.home-manager;
    nxvim  = nixvim.homeManagerModules.nixvim;
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./config
          ./config/flatpaks.nix

          home { home-manager = {
            extraSpecialArgs = { inherit inputs outputs; };
            useGlobalPkgs = true;
            useUserPackages = true;
            users.icedtea.imports = [ ./home nxvim ];
          }; }
        ];
      };
    };

    devShells.${system} = {
      bevy    = import ./shells/bevy.nix    { inherit nixpkgs system; };
      android = import ./shells/android.nix { inherit nixpkgs system; };
    };
  };
}
