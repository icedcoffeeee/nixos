{ ... }:
{
  keymaps = [
    { mode = "n"; key = "<leader>j"; action = "<cmd>BufferLineCyclePrev<cr>"; options = { desc = "Previous buffer"; silent = true; }; }
    { mode = "n"; key = "<leader>k"; action = "<cmd>BufferLineCycleNext<cr>"; options = { desc = "Next buffer"; silent = true; }; }
    { mode = "n"; key = "<leader>q"; action = "<cmd>bn|bd#<cr>"; options = { desc = "Delete buffer"; silent = true; }; }
    { mode = "n"; key = "<leader>b"; action = "<cmd>BufferLineSortByDirectory<cr>"; options = { desc = "Sort buffelinee by directory"; silent = true; }; }
    { mode = "n"; key = "<leader>l"; action = ":vs term://bash<cr>a"; options = { desc = "Open vertical terminal"; silent = true; }; }

    { mode = "n"; key = "<c-h>"; action = "<c-w><c-h>"; options = { desc = "Move focus to the left window"; silent = true; }; }
    { mode = "n"; key = "<c-l>"; action = "<c-w><c-l>"; options = { desc = "Move focus to the right window"; silent = true; }; }
    { mode = "n"; key = "<c-j>"; action = "<c-w><c-j>"; options = { desc = "Move focus to the lower window"; silent = true; }; }
    { mode = "n"; key = "<c-k>"; action = "<c-w><c-k>"; options = { desc = "Move focus to the upper window"; silent = true; }; }

    { mode = "n"; key = "<leader>ce"; action.__raw = "vim.diagnostic.open_float"; options = { desc = "Show diagnostic [E]rror messages"; silent = true; }; }
    { mode = "n"; key = "<leader>cq"; action.__raw = "vim.diagnostic.open_float"; options = { desc = "Open diagnostic [Q]uickfix list"; silent = true; }; }

    { mode = "t"; key = "<esc>"; action = "<C-\\><C-n>"; options = { desc = "Exit terminal mode"; silent = true; }; }

    # plugins
    {
      mode = "n"; key = "<c-b>";
      action.__raw = "require('mini.files').open";
      options = { desc = "Toggle Mini Files"; silent = true; noremap = true; nowait = true; };
    }
    # {
    #   mode = "n"; key = "<c-b>";
    #   action.__raw = "function() require('nvim-tree.api').tree.toggle({ find_file = true }) end";
    #   options = { desc = "Toggle NvimTree"; silent = true; noremap = true; nowait = true; };
    # }
    {
      mode = "n"; key = "<leader>f";
      action = "<cmd>Format<cr>";
      options = { desc = "Format"; silent = true; };
    }
    {
      mode = [ "n" "x" "o" ]; key = "S";
      action.__raw = "function() require('flash').jump() end";
      options = { desc = "Flash"; };
    }
    {
      mode = "o"; key = "r";
      action.__raw = "function() require('flash').remote() end";
      options = { desc = "Remote Flash"; };
    }
    {
      mode = "c"; key = "<c-s>";
      action.__raw = "function() require('flash').toggle() end";
      options = { desc = "Toggle Flash Search"; };
    }
  ];
}
