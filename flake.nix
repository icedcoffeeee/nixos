{
  description = "icedcoffeeee's nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
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
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.noctalia.nixosModules.default
          ./system
          ./home
        ];
      };
    };
}
