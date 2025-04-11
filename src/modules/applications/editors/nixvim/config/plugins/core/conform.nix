{ lib, config, ... }:
let
  inherit (lib) mkOption types;
  inherit (config.myOptions) formatters;
in
{
  options.myOptions.formatters = mkOption {
    type = with types; attrsOf (listOf str);
    default = { };
    description = "Formatters";
  };
  config = {
    plugins.conform-nvim = {
      enable = true;
      lazyLoad.settings.event = [
        "BufReadPre"
        "BufNewFile"
      ];
      settings = {
        format_on_save.__raw = ''
          function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            return {
              lsp_fallback = true,
              async = false,
              -- timeout_ms = 500,
            }
          end
        '';
        formatters_by_ft = formatters;
      };
    };

    keymaps = [
      {
        key = "<leader>lf";
        action.__raw = ''function() require("conform").format() end'';
      }
    ];
  };
}
