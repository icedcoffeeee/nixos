{ pkgs, ... }:
let
  pdf = "${pkgs.texliveBasic}/bin/pdflatex";
  rg = "${pkgs.ripgrep}/bin/rg";
  unzip = "${pkgs.unzip}/bin/unzip";
  texpkg = { name, url, sha256, version }: [(
    pkgs.runCommand name {
      src = pkgs.fetchurl { inherit url sha256; };
      passthru = {
        inherit version;
        pname = name;
        tlType = "run";
      };
    } ''
    ${unzip} $src -d ${name}
    if [[ ! $(${rg} --files|${rg} sty) ]]; then
      mv $(${rg} --files|${rg} 'ins|dtx') .
      ${pdf} *.ins
    fi
    mkdir -p $out/tex/latex/${name}
    cp $(${rg} --files|${rg} sty) $out/tex/latex/${name}
    ''
  )];
in {
  options.texlive.enable = true;
  config = {
    environment.systemPackages = with pkgs; [
      (texlive.combine {
        inherit (texlive) scheme-medium standalone
        fontaxes xstring newtx ebgaramond-maths
        xltabular ltablex makecell enumitem relsize
        blindtext apacite pgfplots chngcntr;

        tabto.pkgs = texpkg {
          name = "tabto";
          url = "https://mirrors.ctan.org/macros/latex/contrib/tabto.zip";
          sha256 = "sha256-fQku5SSg+4ENhlfKh6U8txdhhbCtGwlSSUyKepNpoZ4=";
          version = "1.4";
        };
        titlesec.pkgs = texpkg {
          name = "titlesec";
          url = "https://mirrors.ctan.org/macros/latex/contrib/titlesec.zip";
          sha256 = "sha256-HL3dfcsnmejRxuL+dNxDKggx8V8vRyR010BwxziTjTA=";
          version = "2.17 2025-01-04";
        };
        chngpage.pkgs = texpkg {
          name = "chngpage";
          url = "https://mirrors.ctan.org/install/macros/latex/contrib/changepage.tds.zip";
          sha256 = "sha256-tKImJD+97PVaz4HvJGkJbAzvIPwL3SVZWpxYU0zkdkM=";
          version = "1.2b";
        };
      })
    ];
  };
}
