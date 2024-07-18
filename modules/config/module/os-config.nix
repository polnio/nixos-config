{ lib, config, ... }:
with lib;
let
  cfg = config.settings.os-config;
in
{
  options.settings.os-config = {
    path = mkOption {
      type = with types; str;
      default = "/etc/nixos";
      description = "The path to the NixOS configuration directory.";
    };
    flake = mkOption {
      type = with types; str;
      default = cfg.path;
      description = "The flake to use for the NixOS configuration.";
    };
  };
}
