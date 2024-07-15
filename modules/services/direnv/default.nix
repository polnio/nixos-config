{ osConfig, ... }:
{
  os.environment.systemPackages = [ osConfig.programs.direnv.package ];

  hm.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
