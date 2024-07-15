{ pkgs, ... }:
{
  os.services.gvfs.enable = true;
  os.environment.systemPackages = [ pkgs.nautilus ];

  settings.windows.noBar = [ "org.gnome.Nautilus" ];
}
