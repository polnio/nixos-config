{
  pkgs,
  lib,
  hmConfig,
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
    ) hmConfig.home.shellAliases
  );
in
{
  os.environment.systemPackages = [ pkgs.nushell ];
  hm.programs.nushell = {
    enable = true;
    extraConfig = ''
      ${aliasesStr}
    '';
  };
}
