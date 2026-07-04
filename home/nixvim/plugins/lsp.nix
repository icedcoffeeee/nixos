{ ... }: {
  plugins.lsp = {
    enable = true;
    servers = {
      astro.enable = true;
      biome.enable = true;
      clangd.enable = true;
      emmet_language_server.enable = true;
      svelte.enable = true;
      ts_ls.enable = true;
      tinymist.enable = true;

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
        package = null;
        installRustc = false;
        installCargo = false;
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
    };

    keymaps = {
      lspBuf = {
        "K" = "hover";
        "gd" = "definition";
        "gD" = "declaration";
        "gi" = "implementation";
        "go" = "type_definition";
        "gr" = "references";
        "<leader>rn" = "rename";
        "<leader>ca" = "code_action";
      };
      diagnostic = {
        "[d" = "goto_prev";
        "]d" = "goto_next";
      };
    };
  };
}
