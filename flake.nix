{
  description = "icedcoffeeee's nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    homeman.url = "github:nix-community/home-manager/release-25.05";
    nixnvim.url = "github:nix-community/nixvim/nixos-25.05";
    flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      user = "icedtea";
      host = "nixos";

      system = "x86_64-linux";
      homeman = inputs.homeman.nixosModules.home-manager;
      nixnvim = inputs.nixnvim.homeManagerModules.nixvim;
    in {
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs user host; };
        modules = [
          ./system
          homeman
          {
            home-manager = {
              extraSpecialArgs = { inherit inputs outputs user host; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user}.imports = [ nixnvim ./homeman ./nixnvim ];
            };
          }
        ];
      };
    };
}
