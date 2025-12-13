{ inputs, system, pkgs, ... }:
let sunsetr = inputs.sunsetr.packages.${system}.sunsetr;
in {
  environment.systemPackages = with pkgs; [
    # code
    bear
    bun
    clang-tools
    cmake
    gcc14
    gdb
    gnumake
    gnumeric
    go
    nodejs_24
    perl
    rustup
    typst
    uv

    (python312.withPackages
      (p: with p; [ numpy matplotlib pyqt6 ipython scipy sympy ]))

    # utilities
    appimage-run
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
    sunsetr
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
    adwaita-icon-theme
    evince
    imagemagick
    inkscape
    kdePackages.dolphin
    krita
    libreoffice
    loupe

    # recording
    slurp
    wl-screenrec
    notify-desktop
  ];

  environment.variables = with pkgs.gcc14; {
    CPATH =
      "${cc}/include/c++/${version}:${cc}/include/c++/${version}/x86_64-unknown-linux-gnu";
  };
}
