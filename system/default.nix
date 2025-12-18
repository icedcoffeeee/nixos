{ inputs, pkgs, system, user, ... }: {
  imports = [
    # impure! needs a minimal nixos config
    /etc/nixos/hardware-configuration.nix

    ./hardware.nix
    ./overlays.nix
    ./packages.nix
    ./services.nix
    ./browser.nix
    ./systemd.nix
    ./etc.nix
  ];

  system.stateVersion = "25.11";

  fonts.packages = with pkgs; with pkgs.nerd-fonts; [ jetbrains-mono karla ];
  fonts.fontconfig.defaultFonts.sansSerif = [ "Karla" ];
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  virtualisation.docker.enable = true;
  xdg.portal.wlr.enable = true;
  nixpkgs.overlays = [ inputs.dolphin.overlays.default ];

  programs.adb.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.nix-ld.enable = true; # for uv

  programs.dankMaterialShell.enable = true;
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";
  };

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "networkmanager"
      "video"
      "wheel"

      "adbusers"
      "docker"
    ];
    shell = pkgs.zsh;
  };
}
