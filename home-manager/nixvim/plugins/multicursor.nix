{ pkgs, ... }:
{
  options = { multicursor.enable = true; };
  config = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "multicursor";
        src = pkgs.fetchFromGitHub {
          owner = "jake-stewart";
          repo = "multicursor.nvim";
          rev = "f454cac";
          hash = "sha256-0bFqoTq4d49/REDu6Rnmvms3kDIyEl0N57CpxYp0ImU=";
        };
      })
    ];
    extraConfigLua = ''
      local set = vim.keymap.set
      local mc = require("multicursor-nvim")
      mc.setup()
    
      set({ "n", "v" }, "<M-k>", function() mc.lineAddCursor(-1) end, { desc = "add cursor above" })
      set({ "n", "v" }, "<M-j>", function() mc.lineAddCursor(1) end, { desc = "add cursor below" })
      set({ "n", "v" }, "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Add cursor by matching word/selection" })
      set({ "n", "v" }, "<M-a>", mc.matchAllAddCursors, { desc = "Add all matches" })
      set({ "n", "v" }, "<c-q>", mc.toggleCursor, { desc = "Add and remove cursors" })
      set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add and remove cursors with mouse" })
    
      set(
        "n", "<esc>",
        function()
          vim.cmd([[nohlsearch]])
          if not mc.cursorsEnabled() then mc.enableCursors()
          elseif mc.hasCursors() then mc.clearCursors() end
        end,
        { desc = "Remove cursors and highlight" }
      )
    
      set("v", "I", mc.insertVisual, { desc = "Insert for each line of visual selections" })
      set("v", "A", mc.appendVisual, { desc = "Append for each line of visual selections" })
      set("v", "M", mc.matchCursors, { desc = "Match new cursors within visual selections by regex" })
    
      set({ "v", "n" }, "<c-i>", mc.jumpForward, { desc = "jumplist forward" })
      set({ "v", "n" }, "<c-o>", mc.jumpBackward, { desc = "jumplist backward" })
    
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { link = "Cursor" })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    '';
  };
}
