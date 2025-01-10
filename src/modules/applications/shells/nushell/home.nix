{
  lib,
  config,
  ...
}:
let
  bashSymbols = [
    "|"
    ">"
  ];
  aliasesStr = lib.concatLines (
    lib.mapAttrsToList (
      k: v:
      if lib.any (s: lib.hasInfix s v) bashSymbols then
        ''alias ${k} = bash -c "${v}"''
      else
        "alias ${k} = ${v}"
    ) config.home.shellAliases
  );
in
{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      ${aliasesStr}
    '';
  };
}
