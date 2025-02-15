{ pkgs, ... }:
rec {
  options = {
    texlive.enable = true;
    texpkg = { pkgs, name, url, sha256, version }: let
      unzip = "${pkgs.unzip}/bin/unzip";
      rg = "${pkgs.ripgrep}/bin/rg";
    in {
      pkgs = [(
        pkgs.runCommand name {
          src = pkgs.fetchurl { inherit url sha256; };
          passthru = {
            pname = name;
            inherit version;
            tlType = "run";
          };
        }
        ''
        ${unzip} $src -d ${name}
        mkdir -p $out/tex/latex/${name}
        cp $(${rg} --files|${rg} sty) $out/tex/latex/${name}
        ''
      )];
    };
  };
  config = {
    environment.systemPackages = with pkgs; [
      (texlive.combine {
        inherit (texlive) scheme-medium
        fontaxes xstring newtx ebgaramond-maths
        xltabular ltablex makecell enumitem relsize
        blindtext apacite pgfplots chngcntr;

        tabto = options.texpkg {
          inherit pkgs;
          name = "tabto";
          url = "https://mirrors.ctan.org/macros/latex/contrib/tabto.zip";
          sha256 = "sha256-fQku5SSg+4ENhlfKh6U8txdhhbCtGwlSSUyKepNpoZ4=";
          version = "1.4";
        };
        titlesec = options.texpkg {
          inherit pkgs;
          name = "titlesec";
          url = "https://mirrors.ctan.org/macros/latex/contrib/titlesec.zip";
          sha256 = "sha256-HL3dfcsnmejRxuL+dNxDKggx8V8vRyR010BwxziTjTA=";
          version = "2.17 2025-01-04";
        };
        chngpage = options.texpkg {
          inherit pkgs;
          name = "chngpage";
          url = "https://mirrors.ctan.org/install/macros/latex/contrib/changepage.tds.zip";
          sha256 = "sha256-tKImJD+97PVaz4HvJGkJbAzvIPwL3SVZWpxYU0zkdkM=";
          version = "1.2b";
        };
      })
    ];
  };
}
