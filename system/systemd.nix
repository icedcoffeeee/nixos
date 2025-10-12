{ pkgs, ... }: {
  systemd.user.services.hyprpolkitagent = let
    hyprpolkit = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
    default = [ "default.target" ];
  in {
    description = "hyprpolkitagent";
    wantedBy = default;
    wants = default;
    after = default;
    serviceConfig = {
      Type = "simple";
      ExecStart = hyprpolkit;
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
