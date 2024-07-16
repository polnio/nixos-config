{
  pkgs,
  config,
  lib,
  ...
}:
let
  recursiveMerge =
    with lib;
    attrList:
    let
      f =
        attrPath:
        zipAttrsWith (
          n: values:
          if tail values == [ ] then
            head values
          else if all isList values then
            unique (concatLists values)
          else if all isAttrs values then
            f (attrPath ++ [ n ]) values
          else
            last values
        );
    in
    f [ ] attrList;
in
{
  os.environment.systemPackages = [ pkgs.fusuma ];
  hm.services.fusuma = {
    enable = true;
    settings = {
      swipe = recursiveMerge (
        map (gesture: { ${toString gesture.fingers}.${gesture.direction}.command = gesture.command; }) (
          builtins.filter (x: x != null) config.settings.touchmaps
        )
      );
    };
  };
}
