{ ... }:
{
  myOptions.treesitter = [ "qmljs" ];
  plugins.lsp.servers.qmlls = {
    enable = true;
    settings = {
      cmd = [
        "qmlls"
        "-E"
      ];
    };
  };
}
