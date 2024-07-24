{ lib, ... }:
with lib;
{
  options.settings.keymaps = mkOption {
    type =
      with types;
      listOf (
        nullOr (submodule {
          options = {
            super = mkOption {
              type = bool;
              description = "Super";
              default = false;
            };
            alt = mkOption {
              type = bool;
              description = "Alt";
              default = false;
            };
            control = mkOption {
              type = bool;
              description = "Control";
              default = false;
            };
            shift = mkOption {
              type = bool;
              description = "Shift";
              default = false;
            };
            lockscreen = mkOption {
              type = bool;
              description = "Lockscreen";
              default = false;
            };
            ignoreModifiers = mkOption {
              type = bool;
              description = "Ignore other keys";
              default = false;
            };
            repeat = mkOption {
              type = bool;
              description = "Repeat";
              default = true;
            };
            release = mkOption {
              type = bool;
              description = "Release";
              default = false;
            };
            key = mkOption {
              type = str;
              description = "Key";
            };
            command = mkOption {
              type = str;
              description = "Command";
            };
          };
        })
      );
    default = [ ];
    description = "Keymaps";
  };
}
