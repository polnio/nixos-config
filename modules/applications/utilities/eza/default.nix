{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.eza ];
  hm.programs.eza = {
    enable = true;
    enableNushellIntegration = false;
    git = true;
    icons = true;
  };

  hm.home.shellAliases = {
    l = "eza -la";
    ll = "eza -l";
  };
}
