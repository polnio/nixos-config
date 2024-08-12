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
    screenshot = {
      region = mkCommandOption "Screenshot region";
      full = mkCommandOption "Screenshot full";
    };
    shutdownConfirm = mkCommandOption "Shutdown";
    applauncher = mkCommandOption "Applauncher";
    terminal = mkCommandOption "Terminal";
    fileExplorer = mkCommandOption "File explorer";
    browser = mkCommandOption "Browser";
    editor = mkCommandOption "Editor";
    calculator = mkCommandOption "Calculator";
  };
}
