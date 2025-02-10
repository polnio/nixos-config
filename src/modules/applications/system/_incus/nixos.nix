{ ... }:
{
  virtualisation.incus.enable = true;
  networking.nftables.enable = true;
  users.users.polnio.extraGroups = [ "incus-admin" ];
}
