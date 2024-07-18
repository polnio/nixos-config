{ lib, ... }:
with lib;
{
  options.settings.windows = {
    no-bar = mkOption {
      type = with types; listOf str;
      default = [ ];
      description = "Windows without bar";
    };
  };
}
