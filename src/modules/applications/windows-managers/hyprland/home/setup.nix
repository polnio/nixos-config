# https://github.com/levnikmyskin/hyprland-virtual-desktops
args@{ pkgs, ... }:
let
  common = import ../common.nix args;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      cursor.no_warps = true;
      env = [
        "XCURSOR_SIZE,24"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORM_PLUGIN_PATH,${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins/platforms"
        "XDG_DESKTOP_PORTAL_DIR,${common.xdg_desktop_portal_dir}/share/xdg-desktop-portal/portals"
      ];
    };
  };
}
