{ ... }:
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  opts = {
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    wrap = false;

    shortmess = "I";
    number = true;
    relativenumber = true;
    mouse = "a";
    showmode = false;
    breakindent = true;
    undofile = true;
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";
    updatetime = 250;
    timeoutlen = 300;
    splitright = true;
    splitbelow = true;
    hlsearch = true;

    list = true;
    listchars = { tab = "  "; trail = "·"; nbsp = "␣"; };

    inccommand = "split";  # preview substitutions live as you type
    cursorline = true;
    scrolloff = 10;
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    foldtext = "v:lua.vim.treesitter.foldtext()";
  };

  autoCmd = [
    {
      event = [ "VimLeave" ];
      command = "set guicursor=a:ver25-blinkon2";
    }
    {
      event = [ "TextYankPost" ];
      desc = "Highlight when yanking (copying) text";
      group = "kickstart-highlight-yank";
      callback.__raw = ''
        function()
        vim.highlight.on_yank()
        end
        '';
    }
  ];

  autoGroups = {
    kickstart-highlight-yank = { clear = true; };
  };
}
