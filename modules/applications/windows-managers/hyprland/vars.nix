{ ... }: {
  hm.wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "blackbox";
    "$fileManager" = "$terminal yazi";
    # "$menu" = ''ags -r "const applauncherWindow = (await import('file:///home/polnio/.config/ags/windows/applauncher/index.js')).applauncherWindow; applauncherWindow.visible = !applauncherWindow.visible"'';
    "$menu" = "ags -t applauncher";
  };
}
