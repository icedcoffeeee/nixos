{ user, ... }: {
  services.openssh.enable = true;
  services.udisks2.enable = true;
  services.upower.enable = true;
  services.blueman.enable = true;

  services.displayManager.noctalia-greeter = {
    enable = true;
    greeter-args = "";
    settings = {
      user.default = user;
      auth.allow_empty_password = true;

      output.scale = 1;
      cursor.theme = "Posy_Cursor_Black";
      cursor.size = 25;
      keyboard.layout = "us";
    };
  };

  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.wireplumber.extraConfig."11-bluetooth-policy" = {
    "wireplumber.settings" = {
      "bluetooth.autoswitch-to-headset-profile" = false;
    };
  };

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandlePowerKeyLongPress = "poweroff";
  };

  services.flatpak = {
    enable = true;
    runWithoutGui = false;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/org.vinegarhq.Sober//stable"
    ];
  };
}
