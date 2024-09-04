{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.google-chrome ];

  # Chromecast
  os.networking.firewall = {
    allowedTCPPortRanges = [
      {
        from = 8008;
        to = 8009;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 32768;
        to = 61000;
      }
    ];
  };
}
