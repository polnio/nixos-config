{ lib, ... }:
with lib;
{
  options.settings.autostart = mkOption {
    type =
      with types;
      listOf (
        either str (submodule {
          options = {
            command = mkOption {
              type = with types; str;
              description = "Command";
            };
            allowReload = mkOption {
              type = with types; bool;
              description = "Allow reload";
              default = false;
            };
          };
        })
      );
    default = [ ];
    description = "Autostart";
  };
}
