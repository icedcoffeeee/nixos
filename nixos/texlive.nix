{ pkgs, ... }:
{
  options.texlive.enable = true;
  config = {
    environment.systemPackages = with pkgs; [
      (texlive.combine {
        inherit (texlive) scheme-medium
        fontaxes xstring newtx ebgaramond-maths
        xltabular ltablex makecell enumitem relsize
        blindtext apacite pgfplots chngcntr;

        tabto = import ./texpkg.nix {
          inherit pkgs;
          name = "tabto";
          url = "https://mirrors.ctan.org/macros/latex/contrib/tabto.zip";
          sha256 = "sha256-fQku5SSg+4ENhlfKh6U8txdhhbCtGwlSSUyKepNpoZ4=";
          version = "1.4";
        };
        titlesec = import ./texpkg.nix {
          inherit pkgs;
          name = "titlesec";
          url = "https://mirrors.ctan.org/macros/latex/contrib/titlesec.zip";
          sha256 = "sha256-HL3dfcsnmejRxuL+dNxDKggx8V8vRyR010BwxziTjTA=";
          version = "2.17 2025-01-04";
        };
        chngpage = import ./texpkg.nix {
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
