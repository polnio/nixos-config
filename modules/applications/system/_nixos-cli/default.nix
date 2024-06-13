{ inputs, ... }: {
  inputs.nixos-cli = {
    url = "github:water-sucks/nixos";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  osModules = [ inputs.nixos-cli.nixosModules.nixos-cli ];

  os.services.nixos-cli.enable = true;
}
