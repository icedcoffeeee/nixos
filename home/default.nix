# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./bash.nix
    ./dconf.nix
    ./xdg.nix
    ../nixvim
  ];

  home.username = "icedtea";

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrains Mono" ];

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    obsidian vlc easyeffects kitty-themes youtube-music
    discord telegram-desktop zapzap audacity kdenlive
    thunderbird teams-for-linux zotero todoist onedrive
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };


  # Enable home-manager
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "83535735+icedcoffeeee@users.noreply.github.com";
    userName = "icedcoffeeee";
    extraConfig.init = { defaultBranch = "main"; };
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
  programs.gnome-shell = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      # { package = transparent-top-bar; }
      { package = fullscreen-avoider; }
      { package = appindicator; }
      { package = pip-on-top; }
      { package = clipboard-history; }
    ];
    theme = {
      name = "Graphite-Dark-compact";
      package = pkgs.graphite-gtk-theme.override {
       colorVariants = [ "dark" ];
       sizeVariants = [ "compact" ];
       tweaks = [ "black" "rimless" ];
      };
    };
  };
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 12.0;
    settings = {
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      background_opacity = 0.7;
      linux_display_server = "x11";
    };
    extraConfig = ''
      include ./kitty-onedark.conf
    '';
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
