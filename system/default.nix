{
  inputs,
  pkgs,
  system,
  user,
  ...
}:
{
  imports = [
    # impure! needs a minimal nixos config
    /etc/nixos/hardware-configuration.nix

    ./hardware.nix
    ./overlays.nix
    ./packages.nix
    ./services.nix
    ./browser.nix
    ./systemd.nix
    ./etc.nix
  ];

  system.stateVersion = "25.11";

  fonts.packages =
    with pkgs;
    with pkgs.nerd-fonts;
    [
      jetbrains-mono
      karla
      (stdenv.mkDerivation {
        pname = "IoskeleyMono";
        version = "2.1.0";
        src = fetchzip {
          url = "https://github.com/ahatem/IoskeleyMono/releases/download/v2.1.0/IoskeleyMono-Term-NerdFont.zip";
          sha256 = "sha256-joAhNADErBErDqTrNelJ0ulGZCN/OUZ1SMYyU++7l6U=";
          stripRoot = false;
        };
        installPhase = ''
          runHook preInstall
          install -Dm644 **/*.ttf -t $out/share/fonts/truetype
          runHook postInstall
        '';
      })
    ];
  fonts.fontconfig.defaultFonts.sansSerif = [ "Karla" ];
  fonts.fontconfig.defaultFonts.monospace = [ "IoskeleyMonoTerm Nerd Font Mono" ];

  virtualisation.docker.enable = true;
  xdg.portal.wlr.enable = true;

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri.overrideAttrs (old: {
    doCheck = false;
  });

  programs.noctalia-greeter.enable = true;
  programs.noctalia-greeter = {
    # Optional configuration
    greeter-args = "";
    settings = {
      user.default = user;
      output.scale = 1;
      cursor = {
        theme = "Posy_Cursor_Black";
        size = 25;
      };
      keyboard.layout = "us";
    };
  };

  programs.zsh.enable = true;
  programs.nix-ld.enable = true; # for uv

  programs.steam.enable = true;
  programs.steam.protontricks.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "networkmanager"
      "video"
      "wheel"

      "adbusers"
      "docker"
    ];
    shell = pkgs.zsh;
  };
}
