{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.localsend ];

  settings.windows.no-bar = [ "localsend_app" ];
}
