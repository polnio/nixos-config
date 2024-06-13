{ pkgs, osConfig, ... }: {
  hm.wayland.windowManager.hyprland.settings = {
    exec = [
      "killall swaybg; swaybg -i ${osConfig.stylix.image}"
      # "sleep 0.3; ags -q; ags"
      "ags -q; ags"
    ];
    exec-once = [
      "${pkgs.swaynotificationcenter}/bin/swaync"
      "vesktop --start-minimized"
      "teams-for-linux --minimized"
      "sleep 1; hyprctl reload"
    ];
  };
}
