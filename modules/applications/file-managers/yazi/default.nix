{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.yazi ];
  hm.programs.yazi = {
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
