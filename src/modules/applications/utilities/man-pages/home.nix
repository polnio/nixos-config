{ settings, ... }:
{
  home.sessionVariables.MANPAGER = "${settings.commands.termeditor} +Man!";
}
