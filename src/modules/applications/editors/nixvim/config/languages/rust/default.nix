{ pkgs, ... }:
{
  myOptions.treesitter = [ "rust" ];
  myOptions.formatters.rust = [ "rustfmt" ];
  extraPackages = [
    pkgs.rustfmt
  ];
  plugins.lsp.servers.rust_analyzer = {
    enable = true;
    installCargo = true;
    installRustc = true;
    settings = {
      cargo = {
        allFeatures = true;
      };
      /*
        checkOnSave = {
          # command = "clippy";
        };
      */
      # inlayHints = {
      #   chainingHints = true;
      #   parameterHints = true;
      #   typeHints = true;
      # };
    };
  };
}
