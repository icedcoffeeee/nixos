{ lib, pkgs, ... }:

{
  imports = [ ./bash.nix ./xdg.nix ];
  home.stateVersion = "25.05";

  # home-manager options go here
  home.packages = with pkgs; [
    obsidian
    vlc
    easyeffects
    youtube-music
    blender
    discord
    telegram-desktop
    zapzap
    audacity
    kdePackages.kdenlive
    teams-for-linux
    zotero
    todoist
    onedrive
    obs-studio
  ];

  services.syncthing.enable = true;

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  programs = {
    git.extraConfig.init.defaultBranch = "main";
    gh.enable = true;
    gh.gitCredentialHelper.enable = true;
  };

  illogical-impulse.enable = true;
}
