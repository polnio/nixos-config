{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.whatsapp-for-linux ];

  settings.windows.no-bar = [ "whatsapp-for-linux" ];
}
