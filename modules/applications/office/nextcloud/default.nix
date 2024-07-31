{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.nextcloud-client ];

  settings.autostart = [ "${pkgs.nextcloud-client}/bin/nextcloud" ];
}
