{
  inputs,
  pkgs,
  lib,
  ...
}:
(inputs.nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [
    (
      { ... }:
      {
        # imports = lib.filesystem.listFilesRecursive ./config;
        imports = lib.pipe ./config [
          (lib.filesystem.listFilesRecursive)
          (builtins.filter (x: !lib.hasInfix "/_" (toString x)))
        ];
      }
    )
  ];
}).neovim
