{ pkgs, ... }:
{
  os.hardware.bluetooth.enable = true;
  os.environment.systemPackages = [ pkgs.overskride ];

  settings.windows.no-bar = [ "io.github.kaii_lb.Overskride" ];
}
