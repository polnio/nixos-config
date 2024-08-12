{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.gnome.gnome-boxes ];
  settings.windows.no-bar = [ "org.gnome.Boxes" ];
}
