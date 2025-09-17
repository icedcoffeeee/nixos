{ ... }:
{
  plugins.telescope = {
    enable = true;
    extensions = {
      ui-select.enable = true;
      fzf-native.enable = true;
    };
    settings = {
      defaults = {
        file_ignore_patterns = [ "node_modules" ];
        sorting_strategy = "ascending";
        layout_config.horizontal = {
          prompt_position = "top";
        };
      };
      pickers = {
        find_files = {
          hidden = true;
          find_command = [
            "rg" "--files" "--glob"
            "!{.git/*,.svelte-kit/*,target/*,node_modules/*}"
            "--path-separator" "/"
          ];
        };
      };
    };
    keymaps = {
      "<leader><leader>" = { action = "find_files";  options = { desc = "Search Files"; }; };
      "<leader>s."       = { action = "oldfiles";    options = { desc = "Search Recent Files ('.' for repeat)"; }; };
      "<leader>sb"       = { action = "buffers";     options = { desc = "Find existing buffers"; }; };
      "<leader>sd"       = { action = "diagnostics"; options = { desc = "Search Diagnostics"; }; };
      "<leader>sg"       = { action = "live_grep";   options = { desc = "Search by Grep"; }; };
      "<leader>sk"       = { action = "keymaps";     options = { desc = "Search Keymaps"; }; };
      "<leader>sr"       = { action = "resume";      options = { desc = "Search Resume"; }; };
      "<leader>ss"       = { action = "builtin";     options = { desc = "Search Select Telescope"; }; };
      "<leader>sw"       = { action = "grep_string"; options = { desc = "Search current Word"; }; };
      "<leader>sh"       = { action = "help_tags";   options = { desc = "Search Help"; }; };

      "<leader>/" = {
        action = ''
          function()
          builtin.current_buffer_fuzzy_find(
            require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = false,
            })
          )
          end
        '';
        options = { desc = "Fuzzily search in current buffer"; expr = true; };
      };
      "<leader>s/" = {
        action = ''
          function()
            builtin.live_grep({
              grep_open_files = true,
              prompt_title = "Live Grep in Open Files",
            })
          end
          '';
        options = { desc = "Search in Open Files"; expr = true; };
      };
      "<leader>sn" = {
        action = ''
          function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
          end
          '';
        options ={ desc = "Search Neovim files"; expr = true; };
      };
    };
  };
}
