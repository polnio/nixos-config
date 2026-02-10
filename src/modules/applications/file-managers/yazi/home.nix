{ ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = {
      opener.open = [
        {
          run = ''xdg-open "$@"'';
          orphan = true;
          desc = "Open";
          for = "unix";
        }
      ];
    };
  };
}
