{ pkgs, ... }:
{
  settings = {
    windows.no-bar = [ "org.gnome.Calculator" ];
    commands.calculator = "${pkgs.gnome-calculator}/bin/gnome-calculator";
  };
}
