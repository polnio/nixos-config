{ osConfig, ... }: {
  hm.wayland.windowManager.hyprland.settings = with osConfig.stylix;
    with base16Scheme; {
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
      };
      plugin = {
        hy3 = {
          tabs = {
            "col.inactive" = "0xff${base00}";
            "col.text.inactive" = "0xff${base05}";
            "col.active" = "0xff${base0D}";
            rounding = 10;
            height = 30;
            text_padding = 10;
            text_font = fonts.sansSerif.name;
            text_height = 10;
            text_center = true;
          };
        };
      };
    };
}
