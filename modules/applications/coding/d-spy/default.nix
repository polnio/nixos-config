{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.d-spy ];

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,org.gnome.dspy" ];
}
