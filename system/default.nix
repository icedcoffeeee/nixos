{ outputs, user, host, config, pkgs, lib, ... }:

{
  imports = [ ./hardware.nix ./hyprland.nix ./flatpaks.nix ./packages.nix ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.overlays = [
    # custom icon :P
    (final: prev: {
      kitty = prev.kitty.overrideAttrs (old: {
        nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.imagemagick ];
        postInstall = ''
          convert                  \
          -background none         \
          -resize 256x256          \
          ${./../assets/kitty.png} \
          $out/share/icons/hicolor/256x256/apps/kitty.png
        '';
      });
    })
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = host;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kuala_Lumpur";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  fonts.packages = with pkgs; [ karla font-awesome nerd-fonts.jetbrains-mono ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" ];
  };

  virtualisation.docker.enable = true;
  programs.adb.enable = true;

  services.openssh.enable = true;
  networking.firewall.enable = false;

  system.stateVersion = "25.05";
}
