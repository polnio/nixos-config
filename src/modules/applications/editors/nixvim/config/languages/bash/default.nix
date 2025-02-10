{ pkgs, ... }:
{
  myOptions.formatters.bash = [ "shfmt" ];
  extraPackages = [ pkgs.shfmt ];
}
