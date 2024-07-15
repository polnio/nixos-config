{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.gnome-calculator ];

  settings.windows.noBar = [ "org.gnome.Calculator" ];
}
