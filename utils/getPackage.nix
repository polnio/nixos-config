{ pkgs, self, ... }:
{
  getPackage = path: self.packages.${pkgs.stdenv.hostPlatform.system}.${path};
}
