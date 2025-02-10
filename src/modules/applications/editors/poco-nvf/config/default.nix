{ lib, ... }:
{
  vim = {
    telescope.enable = true;
    snippets.luasnip = {
      enable = true;
      setupOpts = {
        region_check_events = "CursorHold,InsertLeave";
        delete_check_events = "TextChanged,InsertEnter";
      };
    };
    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        next = "<C-n>";
        previous = "<C-p>";
      };
      sources.nvim_lsp.entry_filter = lib.generators.mkLuaInline ''
        function(entry, ctx)
          LOG.debug(entry:get_kind())
          return true
        end
      '';
      setupOpts = {
        snippet.expand = lib.generators.mkLuaInline ''
          function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        '';
        mapping = {
          "<Tab>" = lib.generators.mkLuaInline ''
            cmp.mapping(function(fallback)
              luasnip.jump(1)
            end)
          '';
          "<S-Tab>" = lib.generators.mkLuaInline ''
            cmp.mapping(function(fallback)
              luasnip.jump(-1)
            end)
          '';
        };
      };
    };
  };
}
