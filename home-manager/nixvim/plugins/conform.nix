{ ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings.formatters_by_ft = rec {
      bash = [ "shfmt" ];
      latex = [ "latexindent" ];
      python = [ "ruff_format" "ruff_organize_imports" ];
      rust = [ "rustfmt" ];
      nix = [ "nixfmt" ];

      c = cfmt;
      cpp = cfmt;
      glsl = cfmt;
      vert = cfmt;
      frag = cfmt;
      cfmt = [ "clang_format" ];

      javascript = prettier;
      typescript = prettier;
      typescriptreact = prettier;
      html = prettier;
      css = prettier;
      svelte = prettier;
      prettier = [ "prettierd" ];
    };
  };
}
