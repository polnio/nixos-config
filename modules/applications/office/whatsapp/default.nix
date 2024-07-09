{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.whatsapp-for-linux ];

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,whatsapp-for-linux" ];
}
