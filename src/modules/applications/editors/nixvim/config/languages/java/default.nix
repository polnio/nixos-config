{ pkgs, ... }:
{
  myOptions.treesitter = [ "java" ];
  myOptions.formatters.rust = [ "google-java-format" ];
  extraPackages = [
    pkgs.google-java-format
  ];
  plugins.lsp.servers.jdtls = {
    enable = true;
  };
}
