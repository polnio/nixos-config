{ pkgs, ... }:
{
  myOptions.treesitter = [ "scala" ];
  myOptions.formatters.scala = [ "scalafmt" ];
  extraPackages = [
    pkgs.metals
    pkgs.scalafmt
  ];
  plugins.lsp.servers.metals.enable = true;
}
