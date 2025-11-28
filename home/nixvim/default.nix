{ ... }: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.onedark.enable = true;
    clipboard.register = "unnamedplus";
    clipboard.providers.xclip.enable = true;

    imports = [ ./options.nix ./mappings.nix ./plugins ];
  };
}
