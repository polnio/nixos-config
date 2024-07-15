{
  config,
  osConfig,
  pkgs,
  ...
}:
{
  hm.wayland.windowManager.hyprland.settings = {
    exec = [
      "killall ${pkgs.swaybg}/bin/swaybg; ${pkgs.swaybg}/bin/swaybg -i ${osConfig.stylix.image}"
    ];
    exec-once = [ "sleep 1; ${pkgs.hyprland}/bin/hyprctl reload" ] ++ config.settings.autostart;
  };
}
