{ pkgs, ... }:
{
  vim = {
    extraPackages = with pkgs; [ gcc ];
    languages.clang.enable = true;
  };
}
