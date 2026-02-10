{
  inputs,
  pkgs,
  ...
}:
inputs.nixvim.legacyPackages.${pkgs.stdenv.hostPlatform.system}.makeNixvimWithModule {
  inherit pkgs;
  module =
    { lib, ... }:
    {
      _module.args = {
        inherit inputs;
      };
      imports = lib.pipe ./config [
        lib.filesystem.listFilesRecursive
        (builtins.filter (lib.hasSuffix ".nix"))
      ];
    };
}
