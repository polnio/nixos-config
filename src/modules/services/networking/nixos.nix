{ ... }:
{
  networking = {
    hostName = "PocoMachine";
    networkmanager = {
      enable = true;
      settings = {
        connectivity.uri = "http://ping.archlinux.org/nm-check.txt";
      };
    };
  };
}
