{ pkgs, ... }:
{
  options = {
    ts-autotag.enable = true;
  };
  config = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "ts-autotag";
        src = pkgs.fetchFromGitHub {
          owner = "tronikelis";
          repo = "ts-autotag.nvim";
          rev = "6178353";
          hash = "sha256-JM6r91+3ehAk24kDt0O9iZhTPfXYt+zx5+86Ihh+fOU=";
        };
      })
    ];
    extraConfigLua = ''
      require("ts-autotag").setup({
        auto_rename = { enabled = true }
      })
    '';
  };
}
