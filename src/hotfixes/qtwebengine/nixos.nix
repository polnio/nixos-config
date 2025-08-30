{ ... }:
{
  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
}
