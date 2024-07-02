{ inputs, pkgs, ... }: {
  inputs = {
    nw = {
      # url = "github:polnio/nw";
      url = "flake:nw";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  os.environment.systemPackages = [ inputs.nw.packages.${pkgs.system}.default ];
}
