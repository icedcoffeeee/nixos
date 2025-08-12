{ lib, pkgs, ... }:

{
  imports = [
    ./bash.nix
    ./xdg.nix
    ./waybar.nix
    ../nixvim
  ];

  # home-manager options go here
  home.packages = with pkgs; [
    obsidian vlc easyeffects youtube-music blender
    discord telegram-desktop zapzap audacity kdePackages.kdenlive
    teams-for-linux zotero todoist onedrive obs-studio
  ];

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  programs = {
    git.extraConfig.init.defaultBranch = "main";
    gh.enable = true;
    gh.gitCredentialHelper.enable = true;
  };

  home.file = {
    ".config/hypr/keybindings.conf".source =
      lib.mkForce ../assets/hypr/keybindings.conf;
    ".config/hypr/hypridle.conf".source =
      lib.mkForce ../assets/hypr/hypridle.conf;
    ".config/hypr/hyprshade.toml".source =
      lib.mkForce ../assets/hypr/hyprshade.toml;
  };

  # hydenix home-manager options go here
  hydenix.hm = {
    #! Important options
    enable = true;
    editors = {
      vim = false;
      neovim = false;
      vscode.enable = false;
      default = "neovim";
    };
    spotify.enable = false;
    git = {
      enable = true;
      name = "icedcoffeeee";
      email = "83535735+icedcoffeeee@users.noreply.github.com";
    };
    terminals = {
      enable = true;
      kitty.enable = true;
      kitty.configText = ''
        font_family JetBrainsMono Nerd Font
        font_size 12.000000
        tab_bar_edge top
        tab_bar_style powerline
        window_padding_width 2
      '';
    };
    hyprland = {
      enable = true;
      extraConfig = builtins.readFile ../assets/hypr/hyprland.conf;
    };
    fastfetch.enable = false;
    waybar.enable = false;
    /*
      ! Below are defaults, no need to uncomment them all
      comma.enable = true; # useful nix tool to run software without installing it first
      dolphin.enable = true; # file manager
      editors = {
        enable = true; # enable editors module
        neovim = true; # enable neovim module
        vscode = {
          enable = true; # enable vscode module
          wallbash = true; # enable wallbash extension for vscode
        };
        vim = true; # enable vim module
        default = "code"; # default text editor
      };
      git = {
        enable = true; # enable git module
        name = null; # git user name eg "John Doe"
        email = null; # git user email eg "john.doe@example.com"
      };
      fastfetch.enable = true; # fastfetch configuration
      firefox.enable = true; # enable firefox module
      hyde.enable = true; # enable hyde module
      hyprland = {
        enable = true; # enable hyprland module
        extraConfig = ""; # extra hyprland config text
      };
      lockscreen = {
        enable = true; # enable lockscreen module
        hyprlock = true; # enable hyprlock lockscreen
        swaylock = false; # enable swaylock lockscreen
      };
      notifications.enable = true; # enable notifications module
      qt.enable = true; # enable qt module
      rofi.enable = true; # enable rofi module
      screenshots = {
        enable = true; # enable screenshots module
        grim.enable = true; # enable grim screenshot tool
        slurp.enable = true; # enable slurp region selection tool
        satty.enable = false; # enable satty screenshot annotation tool
        swappy.enable = true; # enable swappy screenshot editor
      };
      shell = {
        enable = true; # enable shell module
        zsh = {
          enable = true; # enable zsh shell
          plugins = [ "sudo" ]; # zsh plugins
          configText = ""; # zsh config text
        };
        bash.enable = false; # enable bash shell
        fish.enable = false; # enable fish shell
        pokego.enable = false; # enable Pokemon ASCII art scripts
        p10k.enable = false; # enable p10k prompt
        starship.enable = true; # enable starship prompt
      };
      social = {
        enable = true; # enable social module
        discord.enable = true; # enable discord module
        webcord.enable = true; # enable webcord module
        vesktop.enable = true; # enable vesktop module
      };
      spotify.enable = true; # enable spotify module
      swww.enable = true; # enable swww wallpaper daemon
      terminals = {
        enable = true; # enable terminals module
        kitty = {
          enable = true; # enable kitty terminal
          configText = ""; # kitty config text
        };
      };
      theme = {
        enable = true; # enable theme module
        active = "Catppuccin Mocha"; # active theme name
        themes = [
          "Catppuccin Mocha"
          "Catppuccin Latte"
        ]; # default enabled themes, full list in https://github.com/richen604/hydenix/tree/main/hydenix/sources/themes
      };
      waybar = {
        enable = true; # enable waybar module
        userStyle = ""; # custom waybar user-style.css
      };
      wlogout.enable = true; # enable wlogout module
      xdg.enable = true; # enable xdg module
    */
  };
}
