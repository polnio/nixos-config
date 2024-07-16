{
  config,
  osConfig,
  pkgs,
  ...
}:
{
  hm.wayland.windowManager.hyprland.settings = {
    exec =
      [ "killall ${pkgs.swaybg}/bin/swaybg; ${pkgs.swaybg}/bin/swaybg -i ${osConfig.stylix.image}" ]
      ++ (builtins.map (x: x.command) (
        builtins.filter (x: x ? command && x.allowReload) config.settings.autostart
      ));
    exec-once =
      [ "sleep 1; ${pkgs.hyprland}/bin/hyprctl reload" ]
      ++ (builtins.map (x: if x ? command then x.command else x) (
        builtins.filter (x: !x ? command || !x.allowReload) config.settings.autostart
      ));
  };
}
