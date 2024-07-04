{ pkgs, ... }: {
  os.services.gvfs.enable = true;
  os.environment.systemPackages = [ pkgs.nautilus ];
}
