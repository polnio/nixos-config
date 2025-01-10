{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.bitwarden-desktop
    pkgs.goldwarden
  ];
}
