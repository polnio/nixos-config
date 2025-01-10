{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.nextcloud-client ];
}
