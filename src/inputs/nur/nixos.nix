{ inputs, ... }:
{
  nixpkgs.overlays = [ inputs.nur.overlays.default ];
  home-manager.users.polnio.nixpkgs.overlays = [ inputs.nur.overlays.default ];
}
