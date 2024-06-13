{ pkgs, inputs, ... }: {
  inputs = {
    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.39.1";
      # url = "github:outfoxxed/hy3?ref=hl0.40.0";
      inputs.hyprland.follows = "hyprland";
    };
  };

  os.services.displayManager.sessionPackages =
    [ inputs.hyprland.packages.${pkgs.system}.hyprland ];

  os.xdg.portal = {
    enable = true;
    extraPortals = [
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  os.environment.systemPackages = with pkgs; [ swaybg ];

  hm.wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hy3.packages.${pkgs.system}.hy3
      # inputs.hycov.packages.${pkgs.system}.hycov
    ];
  };

  hm.services.swayosd.enable = true;
  os.services.udev.packages = with pkgs; [ swayosd ];
}
