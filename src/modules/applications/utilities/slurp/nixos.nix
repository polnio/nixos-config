{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.slurp ];
}
