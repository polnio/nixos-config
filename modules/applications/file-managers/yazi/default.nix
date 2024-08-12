{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.yazi ];
  hm.programs.yazi = {
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  # settings.commands.fileExplorer = "${pkgs.yazi}/bin/yazi";
}
