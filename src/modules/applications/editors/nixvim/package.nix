{
  inputs,
  pkgs,
  ...
}:
inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
  inherit pkgs;
  module =
    { lib, ... }:
    {
      imports = lib.pipe ./config [
        lib.filesystem.listFilesRecursive
        (builtins.filter (lib.hasSuffix ".nix"))
      ];
    };
}
