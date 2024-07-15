{ pkgs, ... }: {
  hm.wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hypr-dynamic-cursors ];
    settings.plugin.dynamic-cursors = {
      enabled = true;
      mode = "rotate";
      rotate = {
        length = 20;
        offset = 0.0;
      };
    };
  };
}
