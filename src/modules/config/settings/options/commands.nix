{ lib, settings, ... }:
with lib;
let
  mkCommandOptionWithDefault =
    name: default:
    mkOption {
      type = with types; nullOr str;
      default = default;
      description = "${name} command";
    };

  mkCommandOption = name: mkCommandOptionWithDefault name null;
in
{
  options.settings.commands = {
    updateSystem = mkCommandOptionWithDefault "Update system" "sudo nixos-rebuild switch --upgrade --flake ${settings.os-config.flake}";
    lock = mkCommandOption "Lock";
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
