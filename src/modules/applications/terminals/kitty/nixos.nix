{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.kitty ];
  xdg.terminal-exec.settings.default = [ "kitty.desktop" ];
}
