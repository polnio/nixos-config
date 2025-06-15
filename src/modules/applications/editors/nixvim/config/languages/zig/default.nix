{ pkgs, ... }:
{
  myOptions.treesitter = [ "zig" ];
  myOptions.formatters.rust = [ "zigfmt" ];
  extraPackages = [
    pkgs.zig
  ];
  plugins.lsp.servers.zls = {
    enable = true;
  };
}
