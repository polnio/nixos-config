{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.gnome.gnome-clocks ];

  settings.windows.noBar = [ "org.gnome.clocks" ];
}
