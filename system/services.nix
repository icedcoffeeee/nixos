{ pkgs, ... }: {
  services.openssh.enable = true;
  services.udisks2.enable = true;
  services.upower.enable = true;

  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandlePowerKeyLongPress = "poweroff";
  };
}
