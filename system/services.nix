{ user, pkgs, ... }: {
  services.openssh.enable = true;
  services.udisks2.enable = true;

  services.logind.extraConfig = ''
    HandlePowerKey = suspend
    HandlePowerKeyLongPress = poweroff
  '';

  services.greetd.enable = true;
  services.greetd.settings.default_session = let
    hyprgreet = pkgs.writeText "hyprgreet" ''
      exec-once = ${pkgs.greetd.regreet}/bin/regreet; ${pkgs.hyprland}/bin/hyprctl dispatch exit
      misc {
          disable_hyprland_logo = true
          disable_splash_rendering = true
          disable_hyprland_qtutils_check = true
      }
    '';
  in {
    user = "greeter";
    command = "${pkgs.hyprland}/bin/hyprland --config ${hyprgreet}";
  };
}
