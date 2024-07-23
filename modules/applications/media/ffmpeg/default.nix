{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.ffmpeg ];
}
