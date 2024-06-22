{ configDir, ... }: {
  os.programs.nh.enable = true;
  os.environment.variables.FLAKE = "${configDir}?submodules=1";
}
