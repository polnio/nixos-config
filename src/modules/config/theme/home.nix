{
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  stylix.targets.fish.enable = false;
  stylix.targets.hyprland.enable = false;
  # hm.stylix.targets.emacs.enable = false;

  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };

  home.pointerCursor = {
    package = lib.mkForce osConfig.stylix.cursor.package;
    name = lib.mkForce osConfig.stylix.cursor.name;
    size = lib.mkForce osConfig.stylix.cursor.size;
    x11.enable = true;
  };
}
