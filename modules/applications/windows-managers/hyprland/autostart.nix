{
  config,
  osConfig,
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
  ) config.settings.autostart;
  autostartCommands = {
    withoutReloadWithoutLogin = builtins.filter (x: !x.allowReload && !x.afterLogin) parsedCommands;
    withReloadWithoutLogin = builtins.filter (x: x.allowReload && !x.afterLogin) parsedCommands;
    withoutReloadWithLogin = builtins.filter (x: !x.allowReload && x.afterLogin) parsedCommands;
    withReloadWithLogin = builtins.filter (x: x.allowReload && x.afterLogin) parsedCommands;
  };
in
{
  hm.wayland.windowManager.hyprland.settings = {
    exec = [
      "killall ${pkgs.swaybg}/bin/swaybg; ${pkgs.swaybg}/bin/swaybg -i ${osConfig.stylix.image}"
    ] ++ (builtins.map (x: x.command) autostartCommands.withReloadWithoutLogin);
    exec-once = [
      "sleep 1; ${pkgs.hyprland}/bin/hyprctl reload"
      (
        config.settings.commands.lock
        + lib.concatMapStrings (x: ";" + x.command) autostartCommands.withoutReloadWithLogin
      )
    ] ++ (builtins.map (x: x.command) autostartCommands.withoutReloadWithoutLogin);
  };
}
