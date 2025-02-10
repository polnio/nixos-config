{ ... }:
{
  myOptions.treesitter = [ "rust" ];
  plugins.lsp.servers.rust_analyzer = {
    enable = true;
    installCargo = true;
    installRustc = true;
    settings.rust-analyzer = {
      cargo = {
        allFeatures = true;
      };
      checkOnSave = {
        # command = "clippy";
      };
      # inlayHints = {
      #   chainingHints = true;
      #   parameterHints = true;
      #   typeHints = true;
      # };
    };
  };
}
