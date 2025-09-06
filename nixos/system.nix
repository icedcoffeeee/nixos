{ pkgs, ... }:

{
  imports = [ ];

  environment.systemPackages = with pkgs; [
    wget tree curl vim git gh xclip zip unzip xdg-utils usbutils
    p7zip.out gnumake cmake ffmpeg cairo pango dconf2nix nodejs_24 bun
    gcc14 clang-tools pandoc perl rustup go gdb tree-sitter
    lazygit lazydocker ripgrep fastfetch popsicle libreoffice
    imagemagick inkscape krita scrcpy kitty btop zathura yazi
    docker-compose texliveFull typst evince loupe hyprshade

    (python312.withPackages (p: with p; [
        numpy matplotlib pyqt6 ipython scipy sympy
    ]))

    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  virtualisation.docker.enable = true;
  programs.adb.enable = true;
  services.openssh.enable = true;

  systemd.user.services.hyprpolkitagent = {
    description = "hyprpolkitagent";
    wantedBy = [ "default.target" ];
    wants = [ "default.target" ];
    after = [ "default.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
  systemd.services.polkit-gnome-authentication-agent-1.enable = false;
  systemd.user.services.polkit-gnome-authentication-agent-1.enable = false;

  services.logind.extraConfig = ''
    HandlePowerKey=suspend
    HandlePowerKeyLongPress=poweroff
  '';
}
