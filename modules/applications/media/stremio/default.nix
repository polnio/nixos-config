{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.stremio ];
}
