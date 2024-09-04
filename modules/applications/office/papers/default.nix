{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.papers ];

  settings.windows.no-bar = [ "org.gnome.Papers" ];
}
