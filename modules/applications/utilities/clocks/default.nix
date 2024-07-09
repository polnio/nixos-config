{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.gnome.gnome-clocks ];

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,org.gnome.clocks" ];
}
