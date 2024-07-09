{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.loupe ];

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,org.gnome.Loupe" ];
}
