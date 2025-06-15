{ settings, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      shell = settings.commands.shell;
      font_size = 11;
    };
  };
  home.shellAliases = {
    icat = "kitty +icat";
  };
}
