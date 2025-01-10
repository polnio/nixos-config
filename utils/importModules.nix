{ lib, ... }:
rec {
  recursiveImport =
    dir:
    lib.flatten (
      lib.mapAttrsToList (
        name: type:
        if lib.hasPrefix "_" name then
          [ ]
        else if type == "directory" then
          recursiveImport (dir + "/${name}")
        else
          dir + "/${name}"
      ) (builtins.readDir dir)
    );

  __isMode =
    name: type: mode:
    (type == "directory" && name == mode) || (type == "regular" && name == "${mode}.nix");

  __getMode =
    name: type:
    if __isMode name type "nixos" then
      "nixos"
    else if __isMode name type "home" then
      "home"
    else if __isMode name type "settings" then
      "settings"
    else
      null;

  __recursiveImportWithMode =
    mode: dir:
    lib.flatten (
      lib.mapAttrsToList (
        name: type:
        let
          mode' = if mode == null then __getMode name type else mode;
        in
        if lib.hasPrefix "_" name then
          [ ]
        else if type == "directory" then
          __recursiveImportWithMode mode' (dir + "/${name}")
        else
          {
            path = dir + "/${name}";
            mode = mode';
          }
      ) (builtins.readDir dir)
    );

  recursiveModules =
    dir:
    let
      imports = __recursiveImportWithMode null dir;
      filtered = lib.filter (x: x.mode != null) imports;
      grouped = lib.groupBy (x: x.mode) filtered;
      result = lib.mapAttrs (_: map (x: x.path)) grouped;
    in
    result;
}
