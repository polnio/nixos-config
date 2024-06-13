{ osConfig, ... }: {
  hm.wayland.windowManager.hyprland.settings.misc =
    with osConfig.stylix.base16Scheme; {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      background_color = "0xff${base00}";
    };
}
