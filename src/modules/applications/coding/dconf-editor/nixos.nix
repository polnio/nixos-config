{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.dconf-editor ];
}
