{ pkgs, ... }:
{
  plugins = {
    fidget.enable = true;
    flash.enable = true;
    friendly-snippets.enable = true;
    gitsigns.enable = true;
    harpoon.enable = true;
    indent-blankline.enable = true;
    luasnip.enable = true;
    nvim-autopairs.enable = true;
    oil.enable = true;
    transparent.enable = true;
    treesitter.enable = true;
    ts-autotag.enable = true;
    vim-surround.enable = true;
    web-devicons.enable = true;

    bufferline = {
      enable = true;
      settings = {
        options = {
          indicator = { style = "underline"; };
          diagnostics = "nvim_lsp";
          sort_by = "insert_after_current";
        };
      };
    };
    mini = {
      enable = true;
      modules = {
        ai.n_lines = 500;
        statusline.use_icons = true;
        statusline.section_location = ''
          function()
          return "%2l:%-2v"
          end
          '';
      };
    };
    nvim-tree = {
      enable = true;
      view = {
        side = "right";
        number = true;
        relativenumber = true;
      };
      actions = {
        expandAll.exclude = [
          ".git"
            "node_modules"
            ".svelte-kit"
        ];
      };
    };
  };

  imports = [
    ./cmp.nix
    ./formatter.nix
    ./lsp.nix
    ./multicursor.nix
    ./telescope.nix
    ./treesitter.nix
  ];
}
