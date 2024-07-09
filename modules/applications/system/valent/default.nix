{ pkgs, ... }: {
  os.programs.kdeconnect = {
    enable = true;
    package = pkgs.valent;
  };

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,valent" ];
}
