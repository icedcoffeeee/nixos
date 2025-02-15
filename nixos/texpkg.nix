{ pkgs, name, url, sha256, version }:
let 
  unzip = "${pkgs.unzip}/bin/unzip";
  rg = "${pkgs.ripgrep}/bin/rg";
in
{
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
}
