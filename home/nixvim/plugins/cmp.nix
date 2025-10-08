{ ... }:
{
  plugins = {
    cmp-buffer.enable = true;
    cmp-emoji.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    cmp = {
      enable = true;
      settings = {
        completion = {
          completeopt = "menu,menuone,noinsert";
        };
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = { 
          expand = ''
            function(args)
            require('luasnip').lsp_expand(args.body)
            end
            '';
        };
        formatting = { fields = [ "kind" "abbr" "menu" ]; };
        sources = [
        { name = "nvim_lsp"; }
        { name = "emoji"; }
        # text within current buffer
        { name = "buffer"; option.get_bufnrs.__raw = "vim.api.nvim_list_bufs"; keywordLength = 3; }
        # file system paths
        { name = "path"; keywordLength = 3; }
        # from nvim lua API
        { name = "nvim_lua"; }
        # snippets
        { name = "luasnip"; keywordLength = 3; }
        ];

        window = {
          completion.__raw = "cmp.config.window.bordered()";
          documentation.__raw = "cmp.config.window.bordered()";
        };

        mapping = {
          "<S-Tab>" = "cmp.mapping.select_prev_item(cmp_select)";
          "<Tab>" = "cmp.mapping.select_next_item(cmp_select)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-k>" = "cmp.mapping.complete()";
          # Scroll up and down the documentation window
          "<C-u>" = "cmp.mapping.scroll_docs(-4)";
          "<C-d>" = "cmp.mapping.scroll_docs(4)";
          # Luasnip
          "<C-l>" = "cmp.mapping(function(fallback)
            if require('luasnip').locally_jumpable(1)
            then require('luasnip').jump(1)
            else fallback() end
          end, {'i','s'})";
          "<C-j>" = "cmp.mapping(function(fallback)
            if require('luasnip').locally_jumpable(-1)
            then require('luasnip').jump(-1)
            else fallback() end
          end, {'i','s'})";
        };
      };
    };
  };
}
