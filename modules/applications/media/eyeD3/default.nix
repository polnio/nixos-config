{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.python312Packages.eyed3 ];
}
