{ ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      kitty = prev.kitty.overrideAttrs {
        nativeBuildInputs = prev.kitty.nativeBuildInputs
          ++ [ prev.imagemagick ];
        postInstall = ''
          magick ${../assets/kitty-dark.png} -background none -resize 256x256 \
            $out/lib/kitty/logo/kitty.png

          magick ${../assets/kitty-dark.png} -background none -resize 128x128 \
            $out/lib/kitty/logo/kitty-128.png

          magick ${../assets/kitty-dark.png} -background none -resize 256x256 \
            $out/share/icons/hicolor/256x256/apps/kitty.png

          cp ${../assets/kitty-dark.svg} \
            $out/share/icons/hicolor/scalable/apps/kitty.svg
        '';
      };
    })
  ];
}
