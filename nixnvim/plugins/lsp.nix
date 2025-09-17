{ ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      astro.enable = true;
      biome.enable = true;
      clangd.enable = true;
      emmet_language_server.enable = true;
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
        installCargo = false;
        installRustc = false;
      };
      svelte = {
        enable = true;
        extraOptions.on_attach.__raw = ''
          function(client)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end
        '';
      };
      tailwindcss = {
        enable = true;
        settings.tailwindCSS.classAttributes = [ "class" "className" "class:list" ".*ClassName.*" "tw" ];
      };
      texlab = {
        enable = true;
        settings.texlab.build.args = [ "-lualatex" "-pvc" "-synctex=1" "%f" ];
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
      extra = [ 
        { key = "<m-l>"; action = "<cmd>LspRestart<cr>"; }
        { key = "<c-h>"; action.__raw = "vim.lsp.buf.signature_help"; mode = [ "i" "s" ]; }
      ];
    };
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
