{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.google-chrome ];

  # Chromecast
  networking.firewall = {
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
