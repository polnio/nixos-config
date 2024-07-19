{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.gnome-calculator ];

  settings = {
    windows.no-bar = [ "org.gnome.Calculator" ];
    commands.calculator = "${pkgs.gnome-calculator}/bin/gnome-calculator";
  };
}
