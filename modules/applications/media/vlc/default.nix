{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.vlc ];
}
