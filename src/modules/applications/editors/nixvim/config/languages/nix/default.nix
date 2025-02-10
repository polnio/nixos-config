{ pkgs, ... }:
{
  myOptions.treesitter = [ "nix" ];
  myOptions.formatters.nix = [ "nixfmt" ];
  myOptions.linters.nix = [ "nix" ];
  plugins.lsp.servers.nil_ls.enable = true;
  extraPackages = [
    pkgs.nixfmt-rfc-style
  ];
}
