{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "proxy" (builtins.readFile ./proxy/proxy))
    (pkgs.writeShellScriptBin "run" (builtins.readFile ./proxy/run))
  ];
}
