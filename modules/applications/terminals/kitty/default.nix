{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.kitty ];
  hm.programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.fish}/bin/fish";
      # shell = "${pkgs.nushell}/bin/nu";
      font_size = 11;
    };
  };
  settings.commands.terminal = "${pkgs.kitty}/bin/kitty";
  os.xdg.terminal-exec.settings.default = [ "kitty.desktop" ];
}
