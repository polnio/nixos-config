{ ... }: {
  os.programs.geary.enable = true;

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,geary" ];
}
