{ pkgs, lib, ... }:
let
  # id is must, com is optional
  flatpaks = [
    { id = "app.zen_browser.zen";
      commit = "b4e09e83dd149f7e8e075958b022dbf5bb3e08b8dbed300e5b2b2efe768aab25"; }
  ];
  command = f: ''
    if [[ -z $(flatpak list --app|rg ${ f.id }) ]]; then
      flatpak install -y ${ f.id }${ if f ? commit then " --commit ${f.commit}" else "" }
    fi
  '';
  commands = builtins.concatStringsSep "\n" (map command flatpaks);
in {
  services.flatpak.enable = true;
  systemd.services.flatpak-system-helper.enable = false;
  systemd.services.flatpak-install = {
    path = with pkgs; [ bash curl flatpak perl ripgrep unzip util-linux zip ];
    script = ''
      flatpak remote-add --if-not-exists flathub \
      https://dl.flathub.org/repo/flathub.flatpakrepo

      ${commands}

      # if [[ -z $(flatpak list --app|rg spotify) ]]; then
      #   flatpak install com.spotify.Client
      #   bash <(curl -sSL https://spotx-official.github.io/run.sh)
      # fi
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
