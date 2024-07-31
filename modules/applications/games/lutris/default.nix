{ pkgs, ... }:
{
  os.environment.systemPackages = [
    (pkgs.lutris.override {
      extraLibraries = pkgs: [
        pkgs.fuse
        pkgs.e2fsprogs
        pkgs.libgpg-error
        pkgs.xorg.libICE
        # pkgs.qt5.qtwayland
      ];
    })
  ];
  hm.xdg.dataFile."qt-plugins".source = "${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins/platforms";

  os.environment.variables.QT_XKB_CONFIG_ROOT = [ "${pkgs.xkeyboard_config}/share/X11/xkb" ];

  settings.windows.no-bar = [ "lutris" ];
}
