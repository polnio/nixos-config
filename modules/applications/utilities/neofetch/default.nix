{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.neofetch ];
}
