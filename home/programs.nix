{ ... }: {
  programs.git = {
    enable = true;
    userName = "icedcoffeeee";
    userEmail = "83535735+icedcoffeeee@users.noreply.github.com";
    extraConfig.init.defaultBranch = "main";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = "12";
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      background_opacity = "0.7";
      window_padding_width = "2";
      italic_font = "auto";
      bold_font = "auto";
      bold_italic_font = "auto";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "1";
      enable_audio_bell = "no";
      hide_window_decorations = "yes";
      confirm_os_window_close = "0";
    };
    themeFile = "OneDark";
  };

  programs.fastfetch.enable = true;
}
