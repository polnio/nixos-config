{ inputs, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      zen-browser = inputs.zen-browser.packages.${super.system}.default;
    })
  ];
}
