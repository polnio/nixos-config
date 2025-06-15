{ pkgs, ... }:
{
  settings.commands.shell = "${pkgs.fish}/bin/fish";
}
