{ pkgs, ... }: {
  os.programs.kdeconnect = {
    enable = true;
    package = pkgs.valent;
  };
}
