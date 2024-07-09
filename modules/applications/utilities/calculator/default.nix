{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.gnome-calculator ];

  hm.wayland.windowManager.hyprland.settings.windowrule = [
    "plugin:hyprbars:nobar,org.gnome.Calculator"
    "float,org.gnome.Calculator"
  ];
}
