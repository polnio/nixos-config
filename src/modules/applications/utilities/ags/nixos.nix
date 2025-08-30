{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.acpi
  ];

  environment.pathsToLink = [ "/share/com.github.Aylur.ags" ];
}
