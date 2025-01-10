{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.python312Packages.eyed3 ];
}
