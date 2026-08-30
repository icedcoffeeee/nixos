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
    ./fonts.nix
    ./etc.nix
  ];

  system.stateVersion = "25.11";

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
      auth.allow_empty_password = true;
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
