{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.eza ];
  hm.programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    git = true;
    icons = true;
  };

  hm.home.shellAliases = {
    l = "eza -la";
    ll = "eza -l";
  };
}
