{ settings, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      # theme = "catppuccin-mocha";
      command = settings.commands.shell;
      font-size = 11;
      window-decoration = "client";
      gtk-single-instance = true;
    };
  };
}
