{ lib, ... }:
let
  inherit (lib) mkOption types;

  typeAlias = types.submodule (
    { config, ... }:
    {
      options = {
        key = mkOption {
          type = types.str;
        };
        mode = mkOption {
          type = types.enum [ "tap-hold" ];
          default = "tap-hold";
        };
        tapTimeout = mkOption {
          type = types.int;
          default = 200;
        };
        holdTimeout = mkOption {
          type = types.int;
          default = 200;
        };
        tapAction = mkOption {
          type = types.str;
          default = config.key;
        };
        holdAction = mkOption {
          type = types.str;
          default = config.key;
        };
      };
    }
  );
in
{
  options.settings.keyboard = {
    aliases = mkOption {
      type = types.listOf typeAlias;
      default = [ ];
    };
  };
}
