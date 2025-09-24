{ inputs, user, ... }:
let homeman = inputs.homeman.nixosModules.home-manager;
in {
  imports = [ homeman ./system ./system/hardware.nix ];

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" "video" "adbusers" "docker" ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  home-manager.users.${user} = { ... }: {
    imports = [
      inputs.illogical.homeManagerModules.default
      inputs.nixnvim.homeManagerModules.nixvim
      ./homeman
      ./nixnvim
    ];
  };
}
