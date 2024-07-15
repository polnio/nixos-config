{ lib, utils, ... }:
let
  inherit (lib)
    attrNames
    optional
    foldlAttrs
    hasPrefix
    hasSuffix
    ;
  inherit (builtins) elem readDir;

  getModulesRecur =
    ignoreDefault: path:
    let
      files = readDir path;
      isModuleDirectory = !ignoreDefault && elem "default.nix" (attrNames files);
    in
    if isModuleDirectory then
      [
        (utils.concatPaths [
          path
          "default.nix"
        ])
      ]
    else
      foldlAttrs (
        acc: name: type:
        if hasPrefix "_" name then
          acc
        else
          acc
          ++ (
            if (type == "regular") then
              optional (name != "default.nix" && hasSuffix "nix" name) (
                utils.concatPaths [
                  path
                  name
                ]
              )
            else
              getModulesRecur false (
                utils.concatPaths [
                  path
                  name
                ]
              )
          )
      ) [ ] files;
  modules = getModulesRecur true ../modules;
in
{
  inherit modules;
}
