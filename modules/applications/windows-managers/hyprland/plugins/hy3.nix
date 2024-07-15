{ pkgs, osConfig, ... }:
with osConfig.stylix;
with base16Scheme;
{
  hm.wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hy3 ];
    settings = {
      general.layout = "hy3";
      plugin.hy3 = {
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
