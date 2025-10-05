{ inputs, lib, pkgs, ... }: {
  imports = [ ./bash.nix ./xdg.nix ];

  home.stateVersion = "25.05";

  home.file = {
    "/.config/hypr/hyprland.conf".source = lib.mkForce ../assets/hyprland.conf;
    "/.config/hypr/hypridle.conf".source = lib.mkForce ../assets/hypridle.conf;
    "/.config/hypr/hyprland/keybinds.conf".source = lib.mkForce ../assets/hyprkeys.conf;
    "/.config/kitty/kitty.conf".source = lib.mkForce ../assets/kitty.conf;
    "/.config/sunsetr/sunsetr.conf".source = lib.mkForce ../assets/sunsetr.conf;
  };

  services.syncthing.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  illogical-impulse.enable = true;

  programs.git.enable = true;
  programs.git.userName = "icedcoffeeee";
  programs.git.userEmail = "83535735+icedcoffeeee@users.noreply.github.com";
  programs.git.extraConfig.init.defaultBranch = "main";

  programs.gh.enable = true;
  programs.gh.gitCredentialHelper.enable = true;

  programs.starship.enable = true;
  programs.starship.enableBashIntegration = true;
  programs.starship.enableZshIntegration = true;

  home.packages = with pkgs; [
    audacity
    blender
    discord
    easyeffects
    obs-studio
    obsidian
    onedrive
    teams-for-linux
    telegram-desktop
    todoist
    vlc
    youtube-music
    zapzap
    zotero

    kdePackages.kdenlive
    inputs.sunsetr.packages.${pkgs.system}.sunsetr
  ];
}
