{ pkgs, ... }:
{
  os.programs.kdeconnect = {
    enable = true;
    package = pkgs.valent;
  };

  settings.windows.noBar = [ "valent" ];
}
