{ pkgs, ... }:
{
  systemd.user.services.niri-flake-polkit.enable = true;
  systemd.services.kill-printd = {
    description = "Kill fprintd before sleep";
    before = [ "sleep.target" ];
    wantedBy = [ "sleep.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.killall}/bin/killall fprintd";
    };
  };
}
