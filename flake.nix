{
  description = "icedtea's nixos";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Flatpak
    flatpak.url = "github:gmodena/nix-flatpak";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixVim
    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    flatpak,
    nixvim,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    overlays = import ./overlays {inherit inputs;};

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [
          ./nixos/configuration.nix
          ./nixos/flatpaks.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
            home-manager.useUserPackages = true;
            home-manager.users.icedtea.imports = [
              nixvim.homeManagerModules.nixvim
              ./home-manager/home.nix
            ];
          }
        ];
      };
    };
  };
}
