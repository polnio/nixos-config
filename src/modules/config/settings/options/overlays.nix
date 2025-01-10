{ lib, config, ... }:
with lib;
let
  overlayType = mkOptionType {
    name = "nixpkgs-overlay";
    description = "nixpkgs overlay";
    check = isFunction;
    merge = mergeOneOption;
  };

  cfg = config.settings.overlays;
in
{
  options.settings.overlays = mkOption {
    type = with types; listOf overlayType;
    default = [ ];
    description = "nixpkgs overlays";
  };

  config = {
    # nixpkgs.overlays = cfg.overlays;
  };
}
