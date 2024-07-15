{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.wl-clipboard ];
}
