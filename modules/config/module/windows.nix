{ lib, ... }:
with lib;
{
  options.settings.windows = {
    noBar = mkOption {
      type = with types; listOf str;
      default = [ ];
      description = "Windows without bar";
    };
  };
}
