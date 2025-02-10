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
      imports = lib.filesystem.listFilesRecursive ./config;
    };
}
