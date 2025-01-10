{ pkgs, ... }:
{
  settings.autostart.teams = "${pkgs.teams-for-linux}/bin/teams-for-linux --minimized";
}
