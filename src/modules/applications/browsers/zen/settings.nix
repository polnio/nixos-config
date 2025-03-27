{ pkgs, ... }:
{
  settings = {
    commands.browser = "${pkgs.zen-browser}/bin/zen";
    windows.no-bar = [ "zen" ];
  };
}
