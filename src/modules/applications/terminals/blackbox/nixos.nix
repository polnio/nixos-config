{ pkgs, ... }:
let
  blackboxPackage = pkgs.blackbox-terminal.override { sixelSupport = true; };
in
{
  environment.systemPackages = [ blackboxPackage ];
}
