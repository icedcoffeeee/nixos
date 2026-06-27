{
  inputs,
  system,
  pkgs,
  ...
}:
let
  noctalia = inputs.noctalia.packages.${system}.default;
in
{
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

    (python313.withPackages (
      p: with p; [
        numpy
        matplotlib
        pyqt6
        ipython
        scipy
        sympy
      ]
    ))

    # utilities
    android-tools
    appimage-run
    btop
    cairo
    curl
    ffmpeg
    gh
    git
    gpu-screen-recorder
    docker-compose
    hyprshade
    killall
    kitty
    kitty-themes
    lazydocker
    lazygit
    noctalia
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
    xmodmap
    xwayland-satellite
    zip

    # graphics
    adwaita-icon-theme
    evince
    imagemagick
    inkscape
    krita
    libreoffice
    loupe
    nautilus
  ];

  environment.variables = {
    CPLUS_INCLUDE_PATH = with pkgs.gcc14; [
      "${cc}/include/c++/${version}"
      "${cc}/include/c++/${version}/x86_64-unknown-linux-gnu"
    ];
  };
}
