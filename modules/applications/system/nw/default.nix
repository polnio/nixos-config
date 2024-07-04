{ inputs, pkgs, configDir, ... }: {
  inputs = {
    nw = {
      # url = "github:polnio/nw";
      url = "flake:nw";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  osModules = [ inputs.nw.nixosModules.default ];
  hmModules = [ inputs.nw.homeManagerModules.default ];

  os.programs.nw.enable = true;
  hm.programs.nw = {
    enable = true;
    settings = {
      general.shell = "${pkgs.fish}/bin/fish";
      nix.os_flake = "${configDir}?submodules=1";
    };
  };
}
