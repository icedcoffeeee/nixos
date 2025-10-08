{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default

    # code
    bear
    bun
    clang-tools
    cmake
    gcc14
    gdb
    gnumake
    go
    nodejs_24
    perl
    rustup
    typst

    (python312.withPackages
      (p: with p; [ numpy matplotlib pyqt6 ipython scipy sympy ]))

    # utilities
    btop
    cairo
    curl
    ffmpeg
    gh
    git
    docker-compose
    hyprshade
    killall
    kitty
    kitty-themes
    lazydocker
    lazygit
    p7zip
    pandoc
    pango
    ripgrep
    scrcpy
    tree
    tree-sitter
    unzip
    usbutils
    vim
    wget
    wl-clipboard
    xdg-utils
    xwayland-satellite
    zip

    # graphics
    evince
    imagemagick
    inkscape
    krita
    libreoffice
    loupe
    nautilus
  ];
}
