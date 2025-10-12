{ inputs, pkgs, user, ... }: {
  imports = [
    # impure! needs a minimal nixos config
    /etc/nixos/hardware-configuration.nix

    ./hardware.nix
    ./packages.nix
    ./services.nix
    ./systemd.nix
    ./etc.nix
  ];

  system.stateVersion = "25.05";

  fonts.packages = with pkgs; with pkgs.nerd-fonts; [ jetbrains-mono karla ];
  fonts.fontconfig.defaultFonts.sansSerif = [ "Karla" ];
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  virtualisation.docker.enable = true;
  xdg.portal.wlr.enable = true;
  nixpkgs.overlays = [ inputs.dolphin.overlays.default ];

  programs.adb.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;

  programs.xss-lock.enable = true;
  programs.xss-lock.lockerCommand =
    let noctalia = inputs.noctalia.packages.${pkgs.system}.default;
    in "${noctalia}/bin/noctalia-shell ipc call lockScreen toggle";

  programs.regreet.enable = true;
  programs.regreet.settings.GTK.application_prefer_dark_theme = true;

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
