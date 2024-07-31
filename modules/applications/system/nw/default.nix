{
  inputs,
  pkgs,
  config,
  ...
}:
{
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
      general = {
        shell = "${pkgs.bash}/bin/bash";
        interactive_shell = "${pkgs.fish}/bin/fish";
      };
      nix.os_flake = config.settings.os-config.flake;
    };
  };

  hm.home.shellAliases = {
    nt = "nw os build -a";
    ns = "nw os build -ab";
    nb = "nw os build -b";
    # nt = "sudo nixos-rebuild test";
    # ns = "sudo nixos-rebuild switch";
    # nb = "sudo nixos-rebuild boot";
    nc = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ${config.settings.os-config.flake}";
  };
}
