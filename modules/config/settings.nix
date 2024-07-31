{
  config,
  pkgs,
  lib,
  ...
}:
let
  openLink = link: "${pkgs.xdg-utils}/bin/xdg-open ${link}";
  mapCommand = command: keymapFn: { inherit command; } // (lib.mapNullable keymapFn command);

  commands = config.settings.commands;
in
{
  settings = {
    keymaps = [
      (mapCommand commands.calculator (command: {
        key = "XF86Calculator";
      }))
      (mapCommand commands.applauncher (command: {
        super = true;
        key = "D";
      }))
      (mapCommand commands.screenshot.region (command: {
        super = true;
        shift = true;
        key = "S";
      }))
      (mapCommand commands.screenshot.full (command: {
        key = "Print";
      }))
      (mapCommand commands.shutdownConfirm (command: {
        super = true;
        shift = true;
        key = "D";
      }))
      (mapCommand commands.terminal (command: {
        super = true;
        key = "Return";
      }))
      (mapCommand commands.browser (command: {
        super = true;
        control = true;
        key = "V";
      }))
      (mapCommand commands.editor (command: {
        super = true;
        control = true;
        key = "C";
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
      (mapCommand commands.applauncher (command: {
        fingers = 4;
        direction = "down";
      }))
      (mapCommand commands.shutdownConfirm (command: {
        fingers = 4;
        direction = "up";
      }))
    ];
  };
}
