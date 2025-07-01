{
  description = "icedtea's hydenix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hydenix.url = "github:richen604/hydenix";

    flake-utils.url = "github:numtide/flake-utils";
    flatpak.url = "github:gmodena/nix-flatpak";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    HOSTNAME = "hydenix";

    hydenixConfig = inputs.hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
      inherit (inputs.hydenix.lib) system;
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos
        ./nixos/flatpaks.nix
      ];
    };
  in
  {
    nixosConfigurations.nixos = hydenixConfig;
    nixosConfigurations.${HOSTNAME} = hydenixConfig;
  } // inputs.flake-utils.lib.eachDefaultSystem (system: {
    devShells = {
      bevy    = import ./shells/bevy.nix    { inherit nixpkgs system; };
      android = import ./shells/android.nix { inherit nixpkgs system; };
    };
  });
}
