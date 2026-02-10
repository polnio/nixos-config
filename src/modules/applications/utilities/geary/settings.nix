{ pkgs, lib, ... }:
{
  settings.windows.no-bar = [ "geary" ];
  settings.autostart.geary.command = "${lib.getExe pkgs.geary} --gapplication-service";
}
