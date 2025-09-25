{ inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      kitty = prev.kitty.overrideAttrs
        (old: { patches = old.patches ++ [ ../assets/kitty.diff ]; });
    })
  ];
}
