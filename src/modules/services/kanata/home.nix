{
  pkgs,
  lib,
  settings,
  ...
}:
let
  parseAliases = fn: lib.concatMapStrings fn settings.keyboard.aliases;
  aliasToStr =
    alias:
    "${alias.key}-mod (${alias.mode} ${toString alias.tapTimeout} ${toString alias.holdTimeout} ${alias.tapAction} ${alias.holdAction}) ";
in
{
  home.packages = with pkgs; [ kanata ];
  xdg.configFile."kanata/kanata.kbd".text = ''
    (defcfg process-unmapped-keys yes)
    (defsrc ${parseAliases (alias: alias.key + " ")})
    (defalias ${parseAliases aliasToStr})
    (deflayer base ${parseAliases (alias: "@${alias.key}-mod ")})
  '';
}
