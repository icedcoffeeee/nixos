{ lib, pkgs, ... }: {
  imports = [ ./waybar.nix ./bash.nix ./xdg.nix ];

  home.packages = with pkgs; [
    audacity blender discord kdePackages.kdenlive obs-studio obsidian todoist
    vlc youtube-music zapzap zotero
  ];

  home.file = {
    ".config/hypr/keybindings.conf".source =
      lib.mkForce ../assets/hyprkeys.conf;
    ".config/hypr/hypridle.conf".source =
      lib.mkForce ../assets/hypridle.conf;
    ".config/hypr/hyprshade.toml".source =
      lib.mkForce ../assets/hyprshade.toml;
    ".config/kitty/theme.conf".source =
      lib.mkForce ../assets/kitty-onedark.conf;
  };

  programs.gh.enable = true;
  programs.gh.gitCredentialHelper.enable = true;
  programs.git.extraConfig.init.defaultBranch = "main";

  hydenix.hm.enable = true;
  hydenix.hm = {
    editors.default = "nvim";
    editors.vim = false;
    editors.neovim = false;
    editors.vscode.enable = false;

    comma.enable = false;
    fastfetch.enable = false;
    firefox.enable = false;
    spotify.enable = false;
    social.enable = false;

    theme.enable = true;
    theme = {
      active = "One Dark";
      themes = [ "One Dark" ];
    };

    hyprland.enable = true;
    hyprland.extraConfig =
      builtins.readFile ../assets/hyprland.conf;

    terminals = {
      kitty.enable = true;
      kitty.configText = ''
        font_family JetBrainsMono Nerd Font
        font_size 12.000000
        tab_bar_edge top
        tab_bar_style powerline
        window_padding_width 2
        '';
    };

    waybar.enable = true;
    waybar.userStyle = ''
      * {
        font-size: 15px;
      }
      tooltip {
        border: 0px;
      }
    '';

    git.enable = true;
    git = {
      name = "icedcoffeeee";
      email = "83535735+icedcoffeeee@users.noreply.github.com";
    };
  };
}
