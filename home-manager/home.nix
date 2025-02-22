# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./dconf.nix
    ./nixvim
  ];

  home.username = "icedtea";

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrains Mono" ];

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    obsidian mpv easyeffects kitty-themes
    discord telegram-desktop zapzap audacity kdenlive
    teams-for-linux zotero todoist onedrive
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };


  # Enable home-manager
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      ".." = "cd ..";
      ga = "git add";
      gc = "git commit";
      gs = "git status";
      ld = "lazydocker";
      lg = "lazygit";
      ll = "ls -alF";
      mk = "mkdir -p";
      nrs = "nixos-rebuild switch --flake ~/nixos";
      ps = "ps -A|rg";
      s = "sudo ";
      v = "nvim";

      open = "xdg-open";
      camset = "sudo modprobe v4l2loopback";
      cam = ''
        scrcpy --v4l2-sink=/dev/video0 \
        --video-source=camera --no-audio \
        --camera-id=1 -m500
      '';
    };
  };
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

  xdg = {
    mimeApps = {
      enable = true;
      associations.added = {
        "application/pdf" = "org.gnome.Evince.desktop";
        "application/xhtml+xml" = "firefox.desktop;app.zen_browser.zen.desktop";
        "text/html" = "firefox.desktop;app.zen_browser.zen.desktop";
        "x-scheme-handler/http" = "firefox.desktop;app.zen_browser.zen.desktop";
        "x-scheme-handler/https" = "firefox.desktop;app.zen_browser.zen.desktop";
      };
      defaultApplications = {
        "application/pdf" = "org.gnome.Evince.desktop";
        "application/xhtml+xml" = "app.zen_browser.zen.desktop";
        "text/html" = "app.zen_browser.zen.desktop";
        "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
        "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
      };
    };
    configFile = {
      "kitty/kitty-onedark.conf".source = ./../assets/kitty/kitty-onedark.conf;
      "autostart/autostart-zen.desktop".text = ''
        [Desktop Entry]
        Type=Application
          Name=zen_browser
          Exec=flatpak run app.zen_browser.zen
          X-GNOME-Autostart-enabled=true
      '';
      "autostart/autostart-spotify.desktop".text = ''
        [Desktop Entry]
        Type=Application
          Name=spotify
          Exec=flatpak run com.spotify.Client
          X-GNOME-Autostart-enabled=true
      '';
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
