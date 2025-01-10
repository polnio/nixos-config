{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.tagger ];
}
