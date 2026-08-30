{ pkgs, ... }: {
  plugins = {
    fidget.enable = true;
    flash.enable = true;
    friendly-snippets.enable = true;
    gitsigns.enable = true;
    harpoon.enable = true;
    indent-blankline.enable = true;
    luasnip.enable = true;
    nvim-autopairs.enable = true;
    transparent.enable = true;
    treesitter.enable = true;
    vim-surround.enable = true;
    web-devicons.enable = true;

    bufferline = {
      enable = true;
      settings = {
        options = {
          sort_by = "insert_after_current";
          separator_style = "slant";
          diagnostics = "nvim_lsp";
          diagnostics_indicator = ''
            function(count, level, diagnostics_dict, context)
              local icon = level:match("error") and " " or " "
              return " " .. icon .. count
            end
          '';
        };
      };
    };
    mini = {
      enable = true;
      modules = {
        ai.n_lines = 500;
        files = {
          mappings = {
            go_in = "L";
            go_in_plus = "";
            go_out = "H";
            go_out_plus = "";
          };
        };
        statusline = {
          use_icons = true;
          section_location = ''
            function()
              return "%2l:%-2v"
            end
          '';
        };
      };
    };
  };

  imports = [
    ./cmp.nix
    ./formatter.nix
    ./lsp.nix
    ./autotag.nix
    ./multicursor.nix
    ./telescope.nix
    ./treesitter.nix
  ];
}
