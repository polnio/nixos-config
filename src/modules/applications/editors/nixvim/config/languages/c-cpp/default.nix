{ pkgs, ... }:
{
  myOptions.treesitter = [
    "c"
    "cpp"
  ];
  myOptions.formatters.c = [ "clang-format" ];
  myOptions.formatters.cpp = [ "clang-format" ];
  plugins.lsp.servers.clangd.enable = true;
  extraPackages = [
    pkgs.clang-tools
  ];
}
