{ ... }:
{
  virtualisation.docker.enable = true;
  users.users.polnio.extraGroups = [ "docker" ];
}
