{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.teams-for-linux ];
  settings.autostart = [ "${pkgs.teams-for-linux}/bin/teams-for-linux --minimized" ];
}
