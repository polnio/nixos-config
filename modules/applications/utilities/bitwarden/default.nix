{ pkgs, ... }:
{
  os.environment.systemPackages = [
    pkgs.bitwarden-desktop
    pkgs.goldwarden
  ];
}
