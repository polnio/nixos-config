{
  pkgs,
  config,
  lib,
  mkUtils,
  ...
}:
let
  utils = mkUtils lib;
in
{
  os.environment.systemPackages = [ pkgs.fusuma ];
  hm.services.fusuma = {
    enable = true;
    settings = {
      swipe = utils.recursiveMerge (
        map (gesture: { ${toString gesture.fingers}.${gesture.direction}.command = gesture.command; }) (
          builtins.filter (x: x != null) config.settings.touchmaps
        )
      );
    };
  };
}
