{ lib, settings, ... }:
{
  getConfigPath =
    path:
    let
      pathStr = toString path;
    in
    assert lib.assertMsg (lib.hasPrefix "/nix/store/" pathStr)
      "${pathStr} does not start with /nix/store/";
    settings.os-config.path
    + "/modules/"
    + builtins.elemAt (builtins.match "/nix/store/[^/]+/(.+)" pathStr) 0;
}
