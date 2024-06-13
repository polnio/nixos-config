{ pkgs, ... }: {
  # os.environment.systemPackages = [ pkgs.google-chrome ];
  # hm.programs.google-chrome = { enable = true; };

  os.programs.chromium = { enable = true; };
}
