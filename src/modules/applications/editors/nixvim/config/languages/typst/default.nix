{ ... }:
{
  myOptions.treesitter = [ "typst" ];
  plugins.lsp.servers.tinymist.enable = true;
  plugins.typst-vim = {
    enable = false;
    settings = {
      pdf_viewer = "zathura";
      conceal = 1;
      auto_open_quickfix = 0;
    };
  };
}
