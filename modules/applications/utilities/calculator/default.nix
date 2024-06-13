{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.gnome.gnome-calculator ];
}
