{
  description = "icedcoffeeee's nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    homeman.url = "github:nix-community/home-manager/release-25.05";
    nixnvim.url = "github:nix-community/nixvim/nixos-25.05";
    flatpak.url = "github:gmodena/nix-flatpak";
    sunsetr.url = "github:psi4j/sunsetr";

    illogical.url = "github:bigsaltyfishes/end-4-dots";
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      user = "icedtea";
      host = "nixos";
      system = "x86_64-linux";

      config = modules:
        nixpkgs.lib.nixosSystem {
          inherit system modules;
          specialArgs = { inherit inputs user host system; };
        };

      isobuild = inputs.nixpkgs
        + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix";
    in {
      nixosConfigurations.${host} = config [ ./icedtea.nix ];
      nixosConfigurations.iso = config [ ./icedtea.nix isobuild ];

      # nix build .#iso
      packages.${system}.iso =
        inputs.self.nixosConfigurations.iso.config.system.build.isoImage;
    };
}
