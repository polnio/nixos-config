{
  pkgs,
  settings,
  config,
  ...
}:
with config.stylix;
with base16Scheme;
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprbars ];
    settings = {
      plugin.hyprbars = {
        bar_color = "0xff${base00}";
        bar_height = 45;
        bar_padding = 12;
        hyprbars-button = [ "0xff${base02}, 22, 󰖭, hyprctl dispatch killactive" ];
        bar_part_of_window = true;
        bar_precedence_over_border = true;
      };
      windowrule = builtins.map (window: "plugin:hyprbars:nobar,${window}") settings.windows.no-bar;
    };
  };
}
