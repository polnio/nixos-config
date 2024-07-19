{ lib, ... }:
with lib;
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
  options.settings.commands = {
    screenshot = mkCommandOption "Screenshot";
    shutdownConfirm = mkCommandOption "Shutdown";
    applauncher = mkCommandOption "Applauncher";
    terminal = mkCommandOption "Terminal";
    browser = mkCommandOption "Browser";
    editor = mkCommandOption "Editor";
    calculator = mkCommandOption "Calculator";
  };
}
