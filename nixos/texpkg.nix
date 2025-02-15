{ pkgs, name, url, sha256, version }:
{
  pkgs = [(
    pkgs.runCommand name {
      src = pkgs.fetchzip { inherit url sha256; };
      passthru = {
        pname = name;
        inherit version;
        tlType = "run";
      };
    }
    ''
    mkdir -p $out/tex/latex/${name}/
    cp $src/* $out/tex/latex/${name}/
    ''
  )];
}
