{ pkgs, config, ... }: {
  /* os.environment.systemPackages = [
       (pkgs.catppuccin-sddm.override {
         flavor = "mocha";
         font = osConfig.stylix.fonts.sansSerif.name;
         fontSize = toString osConfig.stylix.fonts.sizes.desktop;
         # background = osConfig.stylix.image;
         background = config.theme.wallpaper;
       })
     ];
  */
  os.services.displayManager.sddm = {
    enable = true;
    # package = pkgs.libsForQt5.sddm;
    wayland.enable = true;
    # theme = "catppuccin-mocha";
    catppuccin.enable = true;
  };
}
