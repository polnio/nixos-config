{ pkgs, ... }:
{
  settings.autostart.gnome-keyring = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start";
}
