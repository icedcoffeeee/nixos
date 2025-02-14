{ ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      astro.enable = true;
      biome.enable = true;
      clangd.enable = true;
      emmet_language_server.enable = true;
      svelte.enable = true;

      lua_ls = {
        enable = true;
        settings.Lua.diagnostic.disable = [ "missing-fields" ];
      };
      pyright = {
        enable = true;
        settings.python.analysis.typeCheckingMode = "off";
      };
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      tailwindcss = {
        enable = true;
        settings.tailwindCSS.classAttributes = [
          "class"
          "className"
          "class:list"
          ".*ClassName.*"
          "tw"
        ];
      };
      texlab = {
        enable = true;
        settings.texlab.build.args = [
          "-lualatex"
          "-pvc"
          "-synctex=1"
          "%f"
        ];
      };
      ts_ls = {
        enable = true;
        rootDir = "package.json";
      };
      ltex = {
        enable = true;
        settings = {
          enabled = [
            "astro"
            "html"
            "latex"
            "markdown"
            "text"
            "tex"
            "gitcommit"
          ];
          completionEnabled = true;
          language = "en-US";
        };
      };
    };
  };
}
