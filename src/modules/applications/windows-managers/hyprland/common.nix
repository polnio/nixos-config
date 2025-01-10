{ pkgs, ... }:
rec {
  xdg_desktop_portals = [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
  ];
  xdg_desktop_portal_dir = pkgs.symlinkJoin {
    name = "xdg-portals";
    paths = xdg_desktop_portals;
  };
}
