{ pkgs, ... }:
{
  vim = {
    extraPackages = with pkgs; [ ];
    languages.nix.enable = true;
  };
}
