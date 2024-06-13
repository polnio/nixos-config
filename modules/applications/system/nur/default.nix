{ inputs, ... }: {
  inputs.nur.url = "github:nix-community/NUR";
  os.nixpkgs.overlays = [ inputs.nur.overlay ];
}
