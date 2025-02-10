{ lib, config, ... }:
let
  inherit (lib) mkOption types;
  inherit (config.myOptions) linters;
in
{
  options.myOptions.linters = mkOption {
    type = types.attrsOf (types.listOf types.str);
    default = { };
  };
  config = {
    plugins.lint = {
      enable = true;
      lintersByFt = linters;
      lazyLoad.settings.event = [
        "BufReadPre"
        "BufNewFile"
      ];
    };
  };
}
