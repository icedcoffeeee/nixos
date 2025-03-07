{
  description = "icedtea's nixos";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";

    # Flatpak
    flatpak.url = "github:gmodena/nix-flatpak";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixVim
    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, nixvim, home-manager, ... } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          # > Our main nixos configuration file <
          ./nixos/configuration.nix
          ./nixos/flatpaks.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit inputs outputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.icedtea.imports = [
                ./home-manager/home.nix
                nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };
    };
  } // flake-utils.lib.eachDefaultSystem (system: {
    devShells = {
      bevy    = import ./shells/bevy.nix    { inherit nixpkgs system; };
      android = import ./shells/android.nix { inherit nixpkgs system; };
    };
  });
}
