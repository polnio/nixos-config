{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.kitty ];
  hm.programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
    };
  };
}
