{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.kitty ];
  hm.programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.fish}/bin/fish";
      font_size = 11;
    };
  };
  settings.commands.terminal = "${pkgs.kitty}/bin/kitty";
}
