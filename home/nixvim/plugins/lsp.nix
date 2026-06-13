{ ... }: {
  lsp = {
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
        config.Lua.diagnostic.disable = [ "missing-fields" ];
      };
      pyright = {
        enable = true;
        config.python.analysis.typeCheckingMode = "off";
      };
      rust_analyzer = {
        enable = true;
        package = null;
      };
      tailwindcss = {
        enable = true;
        config.tailwindCSS.classAttributes = [
          "class"
          "className"
          "class:list"
          ".*ClassName.*"
          "tw"
        ];
      };
    };

    keymaps = [
      {
        key = "K";
        lspBufAction = "hover";
      }
      {
        key = "gd";
        lspBufAction = "definition";
      }
      {
        key = "gD";
        lspBufAction = "declaration";
      }
      {
        key = "gi";
        lspBufAction = "implementation";
      }
      {
        key = "go";
        lspBufAction = "type_definition";
      }
      {
        key = "gr";
        lspBufAction = "references";
      }
      {
        key = "<leader>rn";
        lspBufAction = "rename";
      }
      {
        key = "<leader>ca";
        lspBufAction = "code_action";
      }
      {
        key = "[d";
        action.__raw = "vim.diagnostic.goto_prev";
      }
      {
        key = "]d";
        action.__raw = "vim.diagnostic.goto_next";
      }
      {
        key = "<m-l>";
        action = "<cmd>LspRestart<cr>";
      }
      {
        key = "<c-h>";
        action.__raw = "vim.lsp.buf.signature_help";
        mode = [
          "i"
          "s"
        ];
      }
    ];
  };
}
