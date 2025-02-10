{ pkgs, config, ... }:
with config.stylix;
with base16Scheme;
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hy3 ];
    settings = {
      general.layout = "hy3";
      plugin.hy3 = {
        tabs = {
          "col.inactive" = "0xff${base00}";
          "col.text.inactive" = "0xff${base05}";
          "col.active" = "0xff${base0D}";
          border_width = 0;
          radius = 10;
          height = 30;
          text_padding = 10;
          text_font = fonts.sansSerif.name;
          text_height = 10;
          text_center = true;
        };
      };
      binde = [
        "SUPER, B, hy3:makegroup, v"
        "SUPER, N, hy3:makegroup, h"
        "SUPER, E, hy3:changegroup, opposite"
        "SUPER, W, hy3:changegroup, toggletab"
        "SUPER SHIFT, W, hy3:makegroup, tab"
        "SUPER, A, hy3:changefocus, raise"
      ];
      bindn = [ ", mouse:272, hy3:focustab, mouse" ];
    };
  };
}
