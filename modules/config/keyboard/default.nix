{ pkgs, ... }: {
  os.i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = [ pkgs.fcitx5-mozc pkgs.fcitx5-gtk pkgs.fcitx5-configtool ];
    };
  };

  os.fonts = {
    packages = [ pkgs.noto-fonts-cjk-sans ];
    fontconfig.defaultFonts = {
      monospace = [ "Noto Sans Mono" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
