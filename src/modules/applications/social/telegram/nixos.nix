{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.telegram-desktop
    pkgs.tg
  ];
}
