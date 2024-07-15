{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.killall ];
}
