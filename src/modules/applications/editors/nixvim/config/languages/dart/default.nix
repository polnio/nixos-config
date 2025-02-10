{ ... }:
{
  myOptions.treesitter = [ "dart" ];
  myOptions.formatters.dart = [ "dartfmt" ];
  plugins.lsp.servers.dartls.enable = true;
}
