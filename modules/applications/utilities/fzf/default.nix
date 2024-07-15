{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.fzf ];
  hm.programs.fzf = {
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
