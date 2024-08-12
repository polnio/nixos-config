{ pkgs, ... }:
{
  hm.wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hypr-dynamic-cursors ];
    settings.plugin.dynamic-cursors = {
      enabled = true;
      mode = "none";
      shake = {
        enabled = true;
        treshold = 1.0;
      };
    };
  };
}
