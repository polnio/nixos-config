{ settings, ... }:
{
  programs.zoxide.enable = true;

  home.shellAliases = {
    zn = "z ${settings.os-config.path}";
    zp = "z ~/Documents/prog";
    zt = "z ~/Documents/prog/test";
  };
}
