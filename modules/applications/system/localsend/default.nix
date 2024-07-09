{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.localsend ];

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,localsend_app" ];
}
