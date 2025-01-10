{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.zsh ];
  environment.pathsToLink = [ "/share/zsh" ];
}
