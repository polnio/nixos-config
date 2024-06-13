{ pkgs, osConfig, ... }: {
  os.environment.systemPackages = [ pkgs.adw-gtk3 ];
  os.programs.regreet = {
    enable = true;
    settings = {
      background.path = toString osConfig.stylix.image;
      GTK.theme_name = "adw-gtk3";
    };
    extraCss = /. + builtins.toPath "/home/polnio/.config/gtk-4.0/gtk.css";
  };
}
