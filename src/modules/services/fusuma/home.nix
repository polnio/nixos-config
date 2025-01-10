{
  settings,
  myUtils,
  ...
}:
{
  services.fusuma = {
    enable = true;
    settings = {
      swipe = myUtils.recursiveMerge (
        map (gesture: { ${toString gesture.fingers}.${gesture.direction}.command = gesture.command; }) (
          builtins.filter (x: x != null) settings.touchmaps
        )
      );
    };
  };
}
