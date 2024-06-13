{ inputs, pkgs, ... }:
let
  xdg_desktop_portal_dir = pkgs.symlinkJoin {
    name = "xdg-portals";
    paths =
      [ inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
  };
in {
  hm.wayland.windowManager.hyprland.settings.env = [
    "XCURSOR_SIZE,24"

    "QT_QPA_PLATFORM,wayland"
    "XDG_CURRENT_DESKTOP,sway"
    "XDG_SESSION_DESKTOP,sway"
    "QT_QPA_PLATFORM_PLUGIN_PATH,${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins/platforms"
    "XDG_DESKTOP_PORTAL_DIR,${xdg_desktop_portal_dir}/share/xdg-desktop-portal/portals"
  ];
}
