{ ... }:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = false;
      ensure_installed = [
        "c"
        "cpp"
        "css"
        "glsl"
        "html"
        "latex"
        "lua"
        "markdown"
        "python"
        "svelte"
        "tsx"
        "typescript"
        "vimdoc"
      ];
      highlight.enable = true;
    };
  };
}
