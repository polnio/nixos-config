{ pkgs, ... }:
{
  settings = {
    commands.browser = "${pkgs.firefox}/bin/firefox";
    windows.no-bar = [ "firefox" ];
  };
}
