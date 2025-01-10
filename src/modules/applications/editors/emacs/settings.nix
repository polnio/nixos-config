{ osConfig, ... }:
{
  settings = {
    commands.editor = "${osConfig.services.emacs.package}/bin/emacsclient -c";
  };
}
