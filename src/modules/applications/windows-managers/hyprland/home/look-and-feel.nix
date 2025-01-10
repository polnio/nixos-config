{ config, ... }:
with config.stylix.base16Scheme;
{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = "yes";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 4, myBezier"
        "windowsOut, 1, 4, default, popin 80%"
        "border, 1, 4, default"
        "borderangle, 1, 4, default"
        "fade, 1, 4, default"
        "workspaces, 1, 4, default"
      ];
    };
    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
      };
      shadow.enabled = true;
    };
    general = {
      gaps_in = 5;
      # gaps_out = "70,20,20,20";
      gaps_out = 20;
      border_size = 2;
      "col.active_border" = "0xff${base0D}";
      "col.inactive_border" = "0xff${base00}";
      allow_tearing = false;
    };
    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      background_color = "0xff${base00}";
    };
    monitor = [
      ",preferred,auto,1"
    ];
  };
}
