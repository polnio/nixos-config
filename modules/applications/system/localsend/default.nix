{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.localsend ];

  os.networking.firewall.allowedTCPPorts = [ 53317 ];

  settings.windows.no-bar = [ "localsend_app" ];
}
