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
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };

        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          "<C-l>" = ''
            cmp.mapping(function()
                if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
                end
                end, { 'i', 's' })
            '';
          "<C-h>" = ''
            cmp.mapping(function()
                if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
                end
                end, { 'i', 's' })
            '';
        };
      };
    };
  };
}
