{ nixpkgs, system }: let
  pkgs = import nixpkgs { inherit system; };
in with pkgs;
mkShell rec {
  nativeBuildInputs = with xorg; [
    pkg-config clang lld
    alsa-lib udev vulkan-loader
    libX11 libXcursor
    libXi libXrandr
    libxkbcommon wayland
  ];
  LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${lib.makeLibraryPath nativeBuildInputs}";
  AMD_VULKAN_ICD = "RADV";
}
