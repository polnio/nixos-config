{ ... }: {
  os.programs.nh.enable = true;
  os.environment.variables.FLAKE = "/etc/nixos?submodules=1";
}
