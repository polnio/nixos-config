{ ... }: {
  hm.wayland.windowManager.hyprland.settings = {
    windowrule = [
      "pseudo,fcitx"

      "fakefullscreen,flameshot"
      "float,flameshot"
      "move 0 0,flameshot"
      "stayfocused, flameshot"

      "workspace 9 silent, vesktop"
    ];
    windowrulev2 = [ "suppressevent maximize, class:.*" ];
  };
}
