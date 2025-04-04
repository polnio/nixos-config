{ pkgs, self, ... }:
{
  getPackage = path: self.packages.${pkgs.system}.${path};
}
