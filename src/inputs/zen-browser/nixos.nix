{ inputs, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      zen-browser = inputs.zen-browser.packages.${super.stdenv.hostPlatform.system}.default;
    })
  ];
}
