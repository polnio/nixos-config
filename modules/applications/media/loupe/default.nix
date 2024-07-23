{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.loupe ];

  settings.windows.no-bar = [ "org.gnome.Loupe" ];
}
