{ pkgs, ... }: {
  os.environment.systemPackages = [
    (pkgs.lutris.override {
      extraLibraries = pkgs: [
        pkgs.fuse
        pkgs.e2fsprogs
        pkgs.libgpg-error
        pkgs.xorg.libICE
      ];
    })
  ];
  hm.xdg.dataFile."qt-plugins".source =
    "${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins/platforms";

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,lutris" ];
}
