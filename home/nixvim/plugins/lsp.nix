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
  extraConfigLua = ''
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border="single" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border="single" })
    -- for rust-analyzer https://github.com/neovim/neovim/issues/30985
    for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
      local default_diagnostic_handler = vim.lsp.handlers[method]
      vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then return end
        return default_diagnostic_handler(err, result, context, config)
      end
    end
  '';
}
