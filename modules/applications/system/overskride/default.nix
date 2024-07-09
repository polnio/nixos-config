{ pkgs, ... }: {
  os.hardware.bluetooth.enable = true;
  os.environment.systemPackages = [ pkgs.overskride ];

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,io.github.kaii_lb.Overskride" ];
}
