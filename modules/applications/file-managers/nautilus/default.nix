{ pkgs, ... }: {
  os.services.gvfs.enable = true;
  os.environment.systemPackages = [ pkgs.nautilus ];

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,org.gnome.Nautilus" ];
}
