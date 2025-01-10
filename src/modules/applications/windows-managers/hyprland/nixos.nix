args@{ pkgs, ... }:
let
  common = import ./common.nix args;
in
{
  environment.systemPackages = [ pkgs.hyprland ];

  xdg.portal = {
    enable = true;
    extraPortals = common.xdg_desktop_portals;
    config.common.default = [ "hyprland,gtk" ];
  };

}
