{ configFlake, ... }:
{
  os.programs.nh.enable = true;
  os.environment.variables.FLAKE = configFlake;

  /*
    hm.home.shellAliases = {
      nt = "nh os test";
      ns = "nh os switch";
      nb = "nh os boot";
      # nt = "sudo nixos-rebuild test";
      # ns = "sudo nixos-rebuild switch";
      # nb = "sudo nixos-rebuild boot";
      nc = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot";
    };
  */
}
