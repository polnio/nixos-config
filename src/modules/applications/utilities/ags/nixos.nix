{ pkgs, hmConfig, ... }:
{
  environment.systemPackages = [
    pkgs.acpi
    hmConfig.programs.ags.package
  ];

  environment.pathsToLink = [ "/share/com.github.Aylur.ags" ];
}
