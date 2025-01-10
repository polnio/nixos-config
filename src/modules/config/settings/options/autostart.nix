{ lib, ... }:
with lib;
{
  options.settings.autostart = mkOption {
    type =
      with types;
      attrsOf (
        either str (submodule {
          options = {
            command = mkOption {
              type = with types; str;
              description = "Command";
            };
            beforeLogin = mkOption {
              type = with types; bool;
              description = "Before login";
              default = false;
            };
            afterLogin = mkOption {
              type = with types; bool;
              description = "After login";
              default = true;
            };
          };
        })
      );
    default = [ ];
    description = "Autostart";
  };
}
