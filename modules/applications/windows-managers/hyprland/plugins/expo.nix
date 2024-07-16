{ pkgs, ... }:
{
  hm.wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprexpo ];
    settings = {
      bind = [ "SUPER, Q, hyprexpo:expo, toggle" ];
    };
    settings.plugin.hyprexpo = {
      workspace_method = "first 1";
      gesture_fingers = 3;
      gesture_positive = false;
    };
  };
}
