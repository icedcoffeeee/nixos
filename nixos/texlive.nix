{ pkgs, ... }:
{
  options.texlive.enable = true;
  config = {
    environment.systemPackages = with pkgs; [
      (texlive.combine {
        inherit (texlive) scheme-medium
        fontaxes xstring newtx ebgaramond-maths
        xltabular makecell enumitem relsize
        blindtext apacite pgfplots chngcntr;

        tabto = import ./texpkg.nix {
          inherit pkgs;
          name = "tabto";
          url = "https://mirrors.ctan.org/macros/latex/contrib/tabto.zip";
          sha256 = "sha256-FZpBrmcwGw5Wi2H1IQqjQfUir6SED/OV6UarojyhUfk=";
          version = "1.4";
        };
        titlesec = import ./texpkg.nix {
          inherit pkgs;
          name = "titlesec";
          url = "https://mirrors.ctan.org/macros/latex/contrib/titlesec.zip";
          sha256 = "sha256-lkwFeOTuS0SH9zyx8Qz5FDA/OIIPlRwIrGUoSwqKq7w=";
          version = "2.17 2025-01-04";
        };
        chngpage = import ./texpkg.nix {
          inherit pkgs;
          name = "chngpage";
          url = "https://mirrors.ctan.org/macros/latex/contrib/changepage.zip";
          sha256 = "sha256-juTvOPqq9/AbKzO5M2raZRRJ3JDUxQJ2t7nZRXGS7lM=";
          version = "1.2b";
        };
      })
    ];
  };
}
