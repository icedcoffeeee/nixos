{ pkgs, ... }:
{
  imports = [];

  services.openssh.enable = true;
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandlePowerKeyLongPress = "poweroff";
  };

  systemd.services.polkit-gnome-authentication-agent-1.enable = false;
  systemd.user.services.polkit-gnome-authentication-agent-1.enable = false;
  systemd.user.services.hyprpolkitagent = {
    description = "hyprpolkitagent";
    wantedBy = [ "default.target" ];
    wants = [ "default.target" ];
    after = [ "default.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
