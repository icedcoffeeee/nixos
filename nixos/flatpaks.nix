{ pkgs, lib, ... }:
let
  flatpaks = [
    "app.zen_browser.zen"
    "com.spotify.Client"
  ];
in {
  services.flatpak.enable = true;
  systemd.services.flatpak-install = {
    path = with pkgs; [
      util-linux flatpak bash curl perl zip unzip
    ];
    script = ''
      flatpak remote-add --if-not-exists flathub \
        https://dl.flathub.org/repo/flathub.flatpakrepo
      flatpak install -y flathub ${toString flatpaks}
      bash <(curl -sSL https://spotx-official.github.io/run.sh)
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
