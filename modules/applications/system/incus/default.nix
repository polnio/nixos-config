{ pkgs, ... }:
{
  os.virtualisation.incus = {
    enable = true;
    package = pkgs.incus;
    preseed = { };
  };
  os.networking.nftables.enable = true;
}
