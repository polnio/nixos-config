{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.zathura ];
  /*
    programs.zathura = {
      enable = true;
      extraConfig = "include catppuccin-mocha";
    };

    xdg.configFile."zathura/catppuccin-mocha".source =
       "${inputs.zathura-catppuccin}/src/catppuccin-mocha";
  */

}
