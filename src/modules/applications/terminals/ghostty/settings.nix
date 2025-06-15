{ pkgs, ... }:
{
  settings.commands.terminal = "${pkgs.ghostty}/bin/ghostty";
  settings.windows.no-bar = [ "com.mitchellh.ghostty" ];
  settings.autostart.ghostty = "${pkgs.ghostty}/bin/ghostty --initial-window=false --quit-after-last-window-closed=false";
}
