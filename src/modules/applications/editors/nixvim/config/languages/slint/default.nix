{ inputs, config, ... }:
let
  lsp_package = config.plugins.lsp.servers.slint_lsp.package;
in
{
  myOptions.treesitter = [ "slint" ];
  plugins.lsp.servers.slint_lsp = {
    enable = true;
    cmd = [
      "${lsp_package}/bin/slint-lsp"
      "-L"
      "material=${inputs.slint-material}/material.slint"
    ];
  };
}
