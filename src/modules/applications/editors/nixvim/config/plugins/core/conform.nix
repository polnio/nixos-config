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
        # format_on_save = true;
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
