{ inputs, user, host, system, ... }: let
  hydenix = inputs.hydenix.inputs;
  config.allowUnfree = true;
  oldnixpkgs.userPkgs = import inputs.nixpkgs { inherit config system; };
  overlays = [
    inputs.hydenix.lib.overlays
    (final: prev: oldnixpkgs)
  ];
  pkgs = import hydenix.hydenix-nixpkgs {
    inherit (inputs.hydenix.lib) system;
    inherit config overlays;
  };

  hydenixmods = inputs.hydenix.lib.nixOsModules;
  hydehomeman = hydenix.home-manager.nixosModules.home-manager;
in {
  nixpkgs.pkgs = pkgs;

  imports = [
    hydenixmods
    hydehomeman
    ./system
    ./system/hardware.nix
    hydenix.nixos-hardware.nixosModules.common-pc
    hydenix.nixos-hardware.nixosModules.common-pc-ssd
    hydenix.nixos-hardware.nixosModules.common-cpu-amd
    hydenix.nixos-hardware.nixosModules.common-gpu-amd
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  home-manager.users.${user} = { ... }: {
    imports = [
      inputs.hydenix.lib.homeModules
      inputs.nixiddb.homeModules.nix-index
      inputs.nixnvim.homeManagerModules.nixvim
      ./homeman
      ./nixnvim
    ];
  };

  hydenix = {
    enable = true;
    hostname = host;
    timezone = "Asia/Kuala_Lumpur";
    locale = "en_US.UTF-8";
  };


  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "hydenix";
    extraGroups = [
      "wheel" "networkmanager" "video"
      "docker" "adbusers"
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "25.05";
}
