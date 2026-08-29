{ pkgs, ... }: {
  home.file = {
    ".local/share/fonts/Garamond-Math.otf".source = ../assets/Garamond-Math.otf;
  };

  home.pointerCursor = {
    enable = true;
    name = "Posy_Cursor_Black";
    package = pkgs.posy-cursors;
    size = 25;
    x11.enable = true;
  };

  home.packages = with pkgs; [
    audacity
    blender
    vesktop
    godot
    mpv
    obs-studio
    obsidian
    todoist
    pear-desktop
    zapzap
    zotero
    kdePackages.kdenlive
  ];
}
