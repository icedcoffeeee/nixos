{
  kitty-icon = final: prev: {
    kitty = prev.kitty.overrideAttrs ( old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [ prev.imagemagick ];
      postInstall = ''
        for i in 16 24 48 64 96 128 256 512; do
          mkdir -p $out/share/icons/hicolor/''${i}x''${i}/apps
          convert \
            -background none \
            -resize ''${i}x''${i} ${./../assets/kitty-icon.png} \
            $out/share/icons/hicolor/''${i}x''${i}/apps/${old.pname}.png
        done
      '';
    });
  };
}
