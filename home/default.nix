{ inputs, user, host, pkgs, ... }: {

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "adbusers"
      "docker"

      "networkmanager"
      "video"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs user host; };
  };

  home-manager.users.${user} = {
    home.stateVersion = "25.05";

    imports = [
      inputs.nixvim.homeManagerModules.nixvim
      inputs.noctalia.homeModules.default

      ./nixvim
      ./noctalia.nix
      ./packages.nix
      ./programs.nix
      ./terminal.nix
      ./services.nix
      ./xdg.nix
    ];
  };
}
