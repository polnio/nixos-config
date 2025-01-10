{
  settings,
  config,
  pkgs,
  lib,
  ...
}:
let
  parsedCommands = builtins.map (
    x:
    if x ? command then
      x
    else
      {
        command = x;
        allowReload = false;
        afterLogin = false;
      }
  ) settings.autostart;
  autostartCommands = {
    withoutReloadWithoutLogin = builtins.filter (x: !x.allowReload && !x.afterLogin) parsedCommands;
    withReloadWithoutLogin = builtins.filter (x: x.allowReload && !x.afterLogin) parsedCommands;
    withoutReloadWithLogin = builtins.filter (x: !x.allowReload && x.afterLogin) parsedCommands;
    withReloadWithLogin = builtins.filter (x: x.allowReload && x.afterLogin) parsedCommands;
  };
in
{
  wayland.windowManager.hyprland.settings = {
    exec = [
      "killall ${pkgs.swaybg}/bin/swaybg; ${pkgs.swaybg}/bin/swaybg -i ${config.stylix.image}"
    ] ++ (builtins.map (x: x.command) autostartCommands.withReloadWithoutLogin);
    exec-once =
      [
        "sleep 1; ${pkgs.hyprland}/bin/hyprctl reload"
      ]
      ++ (builtins.map (x: x.command) autostartCommands.withoutReloadWithoutLogin)
      ++ lib.optional (settings.commands.lock != null) (
        settings.commands.lock
        + lib.concatMapStrings (x: ";" + x.command) autostartCommands.withoutReloadWithLogin
      );
  };
}
