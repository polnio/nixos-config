{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.killall ];
}
