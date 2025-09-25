{ inputs, user, pkgs, ... }:
let homeman = inputs.homeman.nixosModules.home-manager;
in {
  imports = [ ./system ./system/hardware.nix homeman ];

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" "video" "adbusers" "docker" ];
    shell = pkgs.zsh;
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
