{ pkgs, ... }:
{
  myOptions.treesitter = [ "r" ];
  myOptions.formatters.r = [ "air" ];
  extraPackages = [
    (pkgs.rWrapper.override {
      packages = with pkgs.rPackages; [
        languageserver
        FactoMineR
        explor
        xlsx
      ];
    })
    pkgs.air-formatter
  ];
  plugins.lsp.servers.r_language_server = {
    enable = true;
    package = null;
  };
}
