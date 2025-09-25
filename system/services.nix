{ user, pkgs, lib, ... }: {
  services.openssh.enable = true;
  services.udisks2.enable = true;

  services.logind.extraConfig = ''
    HandlePowerKey = suspend
    HandlePowerKeyLongPress = poweroff
  '';

  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    user = user;
    command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --time --cmd 'Hyprland'";
  };
}
