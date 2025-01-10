{ lib, ... }:
with lib;
{
  options.settings.touchmaps = mkOption {
    type =
      with types;
      listOf (
        nullOr (submodule {
          options = {
            fingers = mkOption {
              type = with types; int;
              description = "Number of fingers";
            };
            direction = mkOption {
              type =
                with types;
                enum [
                  "up"
                  "down"
                  "left"
                  "right"
                ];
              description = "Direction";
            };
            command = mkOption {
              type = with types; str;
              description = "Command";
            };
          };
        })
      );
    default = [ ];
    description = "Touchmaps";
  };
}
