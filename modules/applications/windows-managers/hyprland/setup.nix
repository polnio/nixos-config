{ pkgs, ... }: {
  os.xdg.portal = {
    enable = true;
    extraPortals =
      [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  os.environment.systemPackages = with pkgs; [ swaybg ];

  hm.wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hy3
      # inputs.hycov.packages.${pkgs.system}.hycov
    ];
  };

  hm.services.swayosd.enable = true;
  os.services.udev.packages = with pkgs; [ swayosd ];
}
