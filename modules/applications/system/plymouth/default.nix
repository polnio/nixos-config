{ pkgs, ... }:
{
  os.boot.kernelParams = [ "quiet" ];
  os.boot.plymouth = {
    enable = true;
    themePackages = [ (pkgs.catppuccin-plymouth.override { variant = "mocha"; }) ];
    theme = "catppuccin-mocha";
  };
}
