{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.telegram-desktop pkgs.tg ];
}
