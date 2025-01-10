{ pkgs, ... }:
{
  xdg.dataFile."qt-plugins".source = "${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins/platforms";
}
