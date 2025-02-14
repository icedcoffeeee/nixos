{ ... }:
{
  options.lsp = {
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
    keymaps = {
      lspBuf = {
        "K" = "hover";
        "gd" = "definition";
        "gD" = "declaration";
        "gi" = "implementation";
        "go" = "type_definition";
        "gr" = "references";
        "<C-h>" = "signature_help";
        "<leader>rn" = "rename";
        "<leader>ca" = "code_action";
      };
      diagnostic = {
        "[d" = "goto_prev";
        "]d" = "goto_next";
      };
      extra = [ 
        { key = "<m-l>"; action = "<cmd>LspRestart<cr>"; }
      ];
    };
  };
  config = {
    extraConfigLua = ''
      -- for rust-analyzer https://github.com/neovim/neovim/issues/30985
      for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
        local default_diagnostic_handler = vim.lsp.handlers[method]
        vim.lsp.handlers[method] = function(err, result, context, config)
          if err ~= nil and err.code == -32802 then return end
          return default_diagnostic_handler(err, result, context, config)
        end
      end
    '';
  };
}
