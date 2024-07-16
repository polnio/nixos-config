{
  config,
  pkgs,
  lib,
  ...
}:
let
  mapCommand = command: keymapFn: lib.mapNullable keymapFn config.settings.commands.${command};
  openLink = link: "${pkgs.xdg-utils}/bin/xdg-open ${link}";
in
{
  settings = {
    keymaps = [
      (mapCommand "applauncher" (applauncher: {
        super = true;
        key = "D";
        command = applauncher;
      }))
      (mapCommand "screenshot" (screenshot: {
        super = true;
        shift = true;
        key = "S";
        command = screenshot;
      }))
      (mapCommand "shutdownConfirm" (shutdownConfirm: {
        super = true;
        shift = true;
        key = "D";
        command = shutdownConfirm;
      }))
      (mapCommand "terminal" (terminal: {
        super = true;
        key = "Return";
        command = config.settings.commands.terminal;
      }))
      (mapCommand "browser" (browser: {
        super = true;
        control = true;
        key = "V";
        command = config.settings.commands.browser;
      }))
      (mapCommand "editor" (editor: {
        super = true;
        control = true;
        key = "C";
        command = config.settings.commands.editor;
      }))
      {
        super = true;
        control = true;
        key = "M";
        command = openLink "https://mail.google.com";
      }
      {
        super = true;
        control = true;
        key = "W";
        command = openLink "https://web.whatsapp.com";
      }
      {
        super = true;
        control = true;
        key = "G";
        command = openLink "https://github.com";
      }
      {
        super = true;
        control = true;
        key = "P";
        command = openLink "https://github.com/polnio";
      }
    ];
    touchmaps = [
      (mapCommand "applauncher" (applauncher: {
        fingers = 4;
        direction = "down";
        command = applauncher;
      }))
      (mapCommand "shutdownConfirm" (shutdownConfirm: {
        fingers = 4;
        direction = "up";
        command = shutdownConfirm;
      }))
    ];
  };
}
