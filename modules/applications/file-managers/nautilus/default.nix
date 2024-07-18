{ pkgs, ... }:
{
  os.services.gvfs.enable = true;
  os.environment.systemPackages = [ pkgs.nautilus ];

  settings.windows.no-bar = [ "org.gnome.Nautilus" ];
}
