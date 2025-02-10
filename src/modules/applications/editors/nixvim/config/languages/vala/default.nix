{ pkgs, ... }:
{
  myOptions.treesitter = [ "vala" ];
  myOptions.formatters.vala = [
    "uncrustify"
  ];
  myOptions.linters.vala = [
    "vala_lint"
  ];
  plugins.lsp.servers.vala_ls.enable = true;
  extraPackages = [
    pkgs.uncrustify
    pkgs.vala-lint
  ];
}
