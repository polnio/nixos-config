{ pkgs, config, ... }:
{
  os.environment.systemPackages = [ pkgs.zoxide ];
  hm.programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  hm.home.shellAliases = {
    zn = "z ${config.settings.os-config.path}";
    zp = "z ~/Documents/prog";
    zt = "z ~/Documents/prog/test";
  };
}
