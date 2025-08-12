{ pkgs, ... }:
{
  options = { formatter.enable = true; };
  config = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "formatter";
        src = pkgs.fetchFromGitHub {
          owner = "mhartington";
          repo = "formatter.nvim";
          rev = "eb89a1f";
          hash = "sha256-DQjLg413qhKBlEvlupCIdEzfRzQrCy0IFcmomScE2EQ=";
        };
      })
    ];
    extraPackages = with pkgs; [
      shfmt llvmPackages_19.clang-tools typstyle
      nixfmt-classic ruff rustfmt prettier
      texlivePackages.latexindent prettierd
    ];
    extraConfigLua = ''
      local filetype = {
        lua = require("formatter.filetypes.lua").stylua,

        c = require("formatter.filetypes.cpp").clangformat,
        cpp = require("formatter.filetypes.cpp").clangformat,
        glsl = require("formatter.filetypes.cpp").clangformat,

        python = require("formatter.filetypes.python").ruff,
        rust = require("formatter.filetypes.rust").rustfmt,
        tex = require("formatter.filetypes.tex").latexindent,
        nix = require("formatter.filetypes.nix").nixfmt,
        typ = { exe = "typstyle", args = "-i"  },
      }

      local prettier = {
        "css",
        "javascript",
        "json",
        "typescript",
        "typescriptreact",
        "astro",
        "html",
        "svelte",
      }
      for _, lang in ipairs(prettier) do
        filetype[lang] = require("formatter.defaults.prettierd")
      end

      require("formatter").setup({ filetype = filetype })
    '';
  };
}
