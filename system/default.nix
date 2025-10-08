{ pkgs, ... }: {
  imports = [
    # impure! needs a minimal nixos config
    /etc/nixos/hardware-configuration.nix

    ./hardware.nix
    ./packages.nix
    ./services.nix
    ./etc.nix
  ];

  system.stateVersion = "25.05";

  fonts.packages = with pkgs; with pkgs.nerd-fonts; [ jetbrains-mono karla ];
  fonts.fontconfig.defaultFonts.sansSerif = [ "Karla" ];
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  virtualisation.docker.enable = true;
  xdg.portal.wlr.enable = true;

  programs.adb.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;

  programs.regreet.enable = true;
  programs.regreet.settings.GTK.application_prefer_dark_theme = true;
}
