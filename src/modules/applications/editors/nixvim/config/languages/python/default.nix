{ pkgs, ... }:
{
  myOptions.treesitter = [ "python" ];
  myOptions.formatters.python = [
    "isort"
    "black"
  ];
  myOptions.linters.python = [
    "pylint"
  ];
  plugins.lsp.servers.pylsp.enable = true;
  extraPackages = [
    pkgs.isort
    pkgs.black
    pkgs.pylint
  ];
}
