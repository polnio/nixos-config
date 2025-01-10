{ pkgs, ... }:
{
  settings = {
    commands.fileExplorer = "${pkgs.nautilus}/bin/nautilus";
    windows.no-bar = [ "org.gnome.Nautilus" ];
  };
}
