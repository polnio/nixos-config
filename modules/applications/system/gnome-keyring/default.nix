{ pkgs, ... }:
{
  os.services.gnome.gnome-keyring.enable = true;

  settings.autostart = [ "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start" ];
}
