{ ... }: {
  os.programs.evince.enable = true;

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,evince" ];
}
