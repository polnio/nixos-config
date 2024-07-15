{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.whatsapp-for-linux ];

  settings.windows.noBar = [ "whatsapp-for-linux" ];
}
