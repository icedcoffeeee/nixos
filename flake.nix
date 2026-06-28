{
  description = "icedcoffeeee's nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-26.05";

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter/main";
    noctalia-greeter.inputs.nixpkgs.follows = "nixpkgs";

    zen.url = "github:0xc000022070/zen-browser-flake";
    zen.inputs.nixpkgs.follows = "nixpkgs";
    zen.inputs.home-manager.follows = "home-manager";
  };

  outputs =
    inputs:
    let
      user = "icedtea";
      host = "nixos";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.${host} = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit
            inputs
            system
            user
            host
            ;
        };
        modules = [
          inputs.niri.nixosModules.niri
          inputs.home-manager.nixosModules.home-manager
          inputs.noctalia-greeter.nixosModules.default
          ./system

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit
                  inputs
                  system
                  user
                  host
                  ;
              };
            };

            home-manager.users.${user} = {
              home.stateVersion = "25.11";

              imports = [
                inputs.nixvim.homeModules.nixvim
                inputs.noctalia.homeModules.default
                ./home
              ];
            };
          }
        ];
      };
    };
}
