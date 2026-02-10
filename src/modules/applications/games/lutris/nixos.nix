{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.lutris.override {
      extraLibraries = pkgs: [
        pkgs.fuse
        pkgs.e2fsprogs
        pkgs.libgpg-error
        pkgs.xorg.libICE
        pkgs.gtk3
        # pkgs.qt5.qtwayland
        pkgs.libadwaita
        pkgs.gtk4
        pkgs.libwebp
      ];
      extraPkgs = pkgs: [
        pkgs.wineWowPackages.stable
      ];
    })
  ];
  environment.variables.QT_XKB_CONFIG_ROOT = [ "${pkgs.xkeyboard_config}/share/X11/xkb" ];
}
