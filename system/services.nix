{ pkgs, ... }: {
  services.openssh.enable = true;
  services.udisks2.enable = true;
  services.upower.enable = true;
  services.noctalia-shell.enable = true;

  services.logind.extraConfig = ''
    HandlePowerKey = suspend
    HandlePowerKeyLongPress = poweroff
  '';

  services.flatpak.enable = true;
  services.flatpak.packages = [ "app.zen_browser.zen" ];
  services.flatpak.overrides.global.Context.filesystems =
    [ "~/Downloads" "/nix/store:ro" ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = let
        regreet = "${pkgs.greetd.regreet}/bin/regreet";
        niri = "${pkgs.niri}/bin/niri";
        greet = pkgs.writeText "greet" ''
          spawn-sh-at-startup "${regreet}; ${niri} msg action quit --skip-confirmation"
          hotkey-overlay {
            skip-at-startup
          }
        '';
      in {
        user = "greeter";
        command = "${niri} --config ${greet}";
      };
    };
  };
}
