{ pkgs, ... }: {
  os.hardware.bluetooth.enable = true;
  os.environment.systemPackages = [ pkgs.overskride ];
}
