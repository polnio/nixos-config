{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.dconf-editor ];

  settings.windows.no-bar = [ "dconf-editor" ];
}
