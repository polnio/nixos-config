{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.localsend ];

  networking.firewall.allowedTCPPorts = [ 53317 ];
}
