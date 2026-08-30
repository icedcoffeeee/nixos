{ pkgs, ... }: {
  fonts.packages =
    with pkgs;
    with pkgs.nerd-fonts;
    [
      jetbrains-mono
      karla

      (stdenv.mkDerivation {
        pname = "IoskeleyMono";
        version = "2.1.0";
        src = fetchzip {
          url = "https://github.com/ahatem/IoskeleyMono/releases/download/v2.1.0/IoskeleyMono-Term-NerdFont.zip";
          sha256 = "sha256-joAhNADErBErDqTrNelJ0ulGZCN/OUZ1SMYyU++7l6U=";
          stripRoot = false;
        };
        installPhase = ''
          runHook preInstall
          install -Dm644 **/*.ttf -t $out/share/fonts/truetype
          runHook postInstall
        '';
      })
    ];

  fonts.fontconfig.defaultFonts.sansSerif = [ "Karla" ];
  fonts.fontconfig.defaultFonts.monospace = [ "IoskeleyMonoTerm Nerd Font Mono" ];
}
