{ pkgs, ... }: {
  imports = [ ./flatpaks.nix ./services.nix ./v4l2.nix ];

  virtualisation.docker.enable = true;

  programs.adb.enable = true;

  fonts.packages = with pkgs.nerd-fonts; [ jetbrains-mono ];

  environment.systemPackages = with pkgs; [
    (python312.withPackages
      (p: with p; [ numpy matplotlib pyqt6 ipython scipy sympy ]))

    bear
    btop
    bun
    cairo
    clang-tools
    cmake
    curl
    docker-compose
    evince
    ffmpeg
    gcc14
    gdb
    gh
    git
    gnumake
    go
    hyprshade
    imagemagick
    inkscape
    krita
    lazydocker
    lazygit
    libreoffice
    loupe
    nodejs_24
    p7zip.out
    pandoc
    pango
    perl
    ripgrep
    rustup
    scrcpy
    texliveFull
    tree
    tree-sitter
    typst
    unzip
    usbutils
    vim
    wget
    xclip
    xdg-utils
    zip
  ];
}
