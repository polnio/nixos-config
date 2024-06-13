{ osConfig, ... }: {
  # with config.colorScheme.palette; {
  hm.wayland.windowManager.hyprland.settings.general =
    with osConfig.stylix.base16Scheme; {
      gaps_in = 5;
      gaps_out = "70,20,20,20";
      border_size = 2;
      # "col.active_border" = "rgba(89b4faff)";
      # "col.inactive_border" = "rgba(595959aa)";
      "col.active_border" = "0xff${base0D}";
      "col.inactive_border" = "0xff${base00}";
      no_cursor_warps = true;
      layout = "hy3";
      allow_tearing = false;
    };
}
