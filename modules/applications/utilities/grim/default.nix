{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.grim ];
}
