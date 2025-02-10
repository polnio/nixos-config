{ ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      eslint = super.eslint.overrideAttrs {
        dontCheckForBrokenSymlinks = true;
      };
    })
  ];
}
