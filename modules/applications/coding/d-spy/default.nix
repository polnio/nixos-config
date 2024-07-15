{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.d-spy ];

  settings.windows.noBar = [ "org.gnome.dspy" ];
}
