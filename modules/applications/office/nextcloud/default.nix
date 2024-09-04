{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.nextcloud-client ];

  settings.autostart = [
    {
      command = "${pkgs.nextcloud-client}/bin/nextcloud";
      afterLogin = true;
    }
  ];
}
