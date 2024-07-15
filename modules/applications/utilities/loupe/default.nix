{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.loupe ];

  settings.windows.noBar = [ "org.gnome.Loupe" ];
}
