{ ... }:
{
  plugins.bufferline = {
    enable = true;
    settings = {
      highlights = {
        fill.bg = "#1e1e2e";
        separator.fg = "#1e1e2e";
        separator_selected.fg = "#1e1e2e";
      };
      options = {
        custom_filter.__raw = # lua
          ''
            function(buf)
              if vim.fn.bufname(buf) == "" then
                return false
              end
              return true
            end
          '';
      };
    };
  };
  keymaps = [
    {
      key = "<leader>bd";
      action = ":bd<cr>";
      options.silent = true;
      options.desc = "Delete buffer";
    }
    {
      key = "<leader>bD";
      action = ":%bd<cr>";
      options.silent = true;
      options.desc = "Delete all buffers";
    }
  ];
}
