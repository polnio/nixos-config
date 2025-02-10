{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprscroller ];
    settings = {
      general.layout = "scroller";
      bind = [ "SUPER, Q, scroller:toggleoverview, toggle" ];
    };
  };
}
