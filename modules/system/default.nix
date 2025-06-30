{ pkgs, ... }:

{
  imports = [
    # ./example.nix - add your modules here
  ];

  environment.systemPackages = with pkgs; [
    wget tree curl vim git gh xclip zip unzip xdg-utils
    gnumake cmake ffmpeg cairo pango dconf2nix nodejs_24 bun
    gcc14 clang-tools pandoc perl rustup go gdb
    lazygit lazydocker ripgrep fastfetch popsicle libreoffice
    imagemagick inkscape krita scrcpy kitty btop zathura yazi
    docker-compose texliveFull

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
}
