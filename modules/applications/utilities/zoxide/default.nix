{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.zoxide ];
  hm.programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
