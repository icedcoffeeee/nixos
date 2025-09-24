{ pkgs, ... }: {
  imports = [ ./packages.nix ./etc.nix ];
  system.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;
  fonts.packages = with pkgs.nerd-fonts; [ jetbrains-mono ];

  virtualisation.docker.enable = true;

  programs.adb.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
}
