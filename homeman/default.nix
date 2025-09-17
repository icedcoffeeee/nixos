{ lib, pkgs, ... }: {
  imports = [ ./bash.nix ./xdg.nix ];

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
  ];

  services.syncthing.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  programs.gh.enable = true;
  programs.gh.gitCredentialHelper.enable = true;
  programs.git.extraConfig.init.defaultBranch = "main";

  home.file = {
    ".config/onedrive/config".text = ''
      force_session_upload = "true"
      delay_inotify_processing = "true"
    '';

    ".config/hypr/hyprshade.toml".text = ''
      [[shades]]
      name = "vibrance"
      default = true

      [[shades]]
      name = "blue-light-filter"
      start_time = 00:00:00
      end_time = 06:00:00
    '';
  };
}
