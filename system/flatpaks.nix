{ pkgs, ... }:
{
  services.flatpak.enable = true;
  systemd.services.flatpak-system-helper.enable = true;
  systemd.services.flatpak-install = let
    flatpaks = [
      { id = "app.zen_browser.zen"; }
    ];
    install = f: ''
      if [[ -z $(flatpak list --app | grep ${f.id}) ]]
      then flatpak install -y ${f.id}
      fi
      '';
    commands = builtins.concatStringsSep "\n" (map install flatpaks);
  in {
    path = with pkgs; [ flatpak ];
    wantedBy = [ "multi-user.target" ];
    script = ''
      flatpak remote-add --if-not-exists \
      flathub https://dl.flathub.org/repo/flathub.flatpakrepo

      ${commands}
    '';
  };
}
