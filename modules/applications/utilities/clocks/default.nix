{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.gnome.gnome-clocks ];

  settings.windows.no-bar = [ "org.gnome.clocks" ];
}
