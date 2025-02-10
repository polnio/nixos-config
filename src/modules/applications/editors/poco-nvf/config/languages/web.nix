{ pkgs, ... }:
{
  vim = {
    extraPackages = with pkgs; [ ];
    languages.html.enable = true;
    languages.ts.enable = true;
  };
}
