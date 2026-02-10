{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.man-pages ];
}
