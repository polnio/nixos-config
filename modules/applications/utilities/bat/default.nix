{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.bat ];
  /*
    programs.bat = {
      enable = true;
      themes = {
        catppuccin = {
          src = inputs.bat-catppuccin;
          file = "themes/Catppuccin Mocha.tmTheme";
        };
      };
      config = { theme = "catppuccin"; };
    };
  */
}
