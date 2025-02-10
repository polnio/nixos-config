{ ... }:
let
  borderedWindow = {
    border = "rounded";
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
    zindex = 1001;
  };
in
{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    cmdline = {
      "/" = {
        mapping.__raw = ''cmp.mapping.preset.cmdline()'';
        sources = [ { name = "buffer"; } ];
      };
      "?" = {
        mapping.__raw = ''cmp.mapping.preset.cmdline()'';
        sources = [ { name = "buffer"; } ];
      };
      ":" = {
        mapping.__raw = ''cmp.mapping.preset.cmdline()'';
        sources = [
          { name = "path"; }
          { name = "cmdline"; }
        ];
      };
      filetype.gitcommit = {
        sources = [
          { name = "git"; }
          { name = "buffer"; }
        ];
      };
    };
    settings = {
      snippet.expand.__raw = # lua
        ''
          function(args)
            require("luasnip").lsp_expand(args.body)
          end
        '';
      sources = [
        # { name = "otter"; }
        { name = "nvim_lsp"; }
        # { name = "vsnip"; } # For vsnip users.
        { name = "luasnip"; } # For luasnip users.
        # { name = "ultisnips"; } # For ultisnips users.
        # { name = "snippy"; } # For snippy users.
        { name = "path"; }
        { name = "buffer"; }
      ];
      window = {
        completion = borderedWindow;
        documentation = borderedWindow;
      };
      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<CR>" = "cmp.mapping.confirm({ select = false })";
        "<Tab>" =
          "cmp.mapping(function(fallback) if require('luasnip').expand_or_jumpable() then vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '') else fallback() end end, {'i', 's'})";
        "<S-Tab>" =
          "cmp.mapping(function(fallback) if require('luasnip').jumpable(-1) then vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '') else fallback() end end, {'i', 's'})";
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-e>" = "cmp.mapping.close()";
        "<C-y>" = "cmp.mapping.confirm({ select = true })";
      };
    };
  };
}
