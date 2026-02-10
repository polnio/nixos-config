{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ confy ];
}
