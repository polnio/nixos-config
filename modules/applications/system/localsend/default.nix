{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.localsend ];

  settings.windows.noBar = [ "localsend_app" ];
}
