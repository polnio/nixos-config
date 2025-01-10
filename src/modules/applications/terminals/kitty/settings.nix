{ pkgs, ... }:
{
  settings.commands.terminal = "${pkgs.kitty}/bin/kitty";
}
