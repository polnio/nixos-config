{ pkgs, ... }:
{
  myOptions.treesitter = [ "zig" ];
  myOptions.formatters.zig = [ "zigfmt" ];
  extraPackages = [
    pkgs.zig
  ];
  plugins.lsp.servers.zls = {
    enable = true;
  };
}
