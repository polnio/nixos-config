{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.zoxide ];
  hm.programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  hm.home.shellAliases = {
    zp = "z ~/Documents/prog";
    zt = "z ~/Documents/prog/test";
  };
}
