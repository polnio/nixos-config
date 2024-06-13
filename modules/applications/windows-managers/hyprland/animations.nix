{ ... }: {
  hm.wayland.windowManager.hyprland.settings.animations = {
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
}
