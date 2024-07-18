{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.d-spy ];

  settings.windows.no-bar = [ "org.gnome.dspy" ];
}
