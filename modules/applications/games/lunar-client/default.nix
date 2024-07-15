{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.lunar-client ];
}
