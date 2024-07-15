{ pkgs, ... }:
{
  os.hardware.bluetooth.enable = true;
  os.environment.systemPackages = [ pkgs.overskride ];

  settings.windows.noBar = [ "io.github.kaii_lb.Overskride" ];
}
