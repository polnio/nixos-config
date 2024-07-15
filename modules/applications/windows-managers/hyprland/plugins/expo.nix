{ pkgs, ... }:
{
  hm.wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprexpo ];
    settings = {
      bind = [ "SUPER, Q, hyprexpo:expo, toggle" ];
    };
  };
}
