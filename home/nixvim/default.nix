{ ... }: {
  programs.nixvim = {
    enable = true;
    nixpkgs.config.allowUnfree = true;
    defaultEditor = true;

    colorschemes.onedark.enable = true;
    clipboard.register = "unnamedplus";
    clipboard.providers.xclip.enable = true;

    imports = [
      ./options.nix
      ./mappings.nix
      ./plugins
    ];
  };
}
