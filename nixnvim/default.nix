{ ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.onedark = { 
      enable = true;
      settings.style = "deep";
    };

    colorschemes.tokyonight = {
      enable = false;
      settings.styles = {
        sidebars = "transparent";
        float = "transparent";
      };
    };

    clipboard.register = "unnamedplus";
    clipboard.providers.xclip.enable = true;

    imports = [
      ./options.nix
      ./mappings.nix
      ./plugins
    ];
  };
}
