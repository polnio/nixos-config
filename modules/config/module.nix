{ lib, ... }:
with lib;
{
  options = {
    settings = {
      commands =
        let
          mkCommandOption =
            name:
            mkOption {
              type = with types; nullOr str;
              default = null;
              description = "${name} command";
            };
        in
        {
          screenshot = mkCommandOption "Screenshot";
          shutdownConfirm = mkCommandOption "Shutdown";
          applauncher = mkCommandOption "Applauncher";
          terminal = mkCommandOption "Terminal";
          browser = mkCommandOption "Browser";
          editor = mkCommandOption "Editor";
        };
      keymaps = mkOption {
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
      autostart = mkOption {
        type = with types; listOf str;
        default = [ ];
        description = "Autostart";
      };

      windows = {
        noBar = mkOption {
          type = with types; listOf str;
          default = [ ];
          description = "Windows without bar";
        };
      };
    };
  };
}
