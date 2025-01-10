{ pkgs, ... }:
{
  settings.commands.lock = "${pkgs.hyprlock}/bin/hyprlock";
}
