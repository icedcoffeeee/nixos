{
  description = "icedtea's hydenix";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    hydenix.url = "github:icedcoffeeee/hydenix";
    nixiddb.url = "github:nix-community/nix-index-database";
    flatpak.url = "github:gmodena/nix-flatpak";
    nixnvim.url = "github:nix-community/nixvim/nixos-25.05";
  };

  outputs = inputs: let
    user = "icedtea";
    host = "nixos";
    system = inputs.hydenix.lib.system;

    hydenix = modules: inputs.hydenix.inputs.hydenix-nixpkgs.
      lib.nixosSystem {
        inherit system modules;
        specialArgs = { inherit inputs user host system; };
      };

    isobuild = inputs.nixpkgs +
      "/nixos/modules/installer" +
      "/cd-dvd/installation-cd-minimal.nix";
  in {
    nixosConfigurations.${host} = hydenix [ ./hyde.nix ];
    nixosConfigurations.iso     = hydenix [ ./hyde.nix isobuild
      ({lib,...}:{networking.networkmanager.enable = lib.mkForce false;}) ];
    packages.${system}.iso = inputs.self.
      nixosConfigurations.iso.config.system.build.isoImage;
  };
}
