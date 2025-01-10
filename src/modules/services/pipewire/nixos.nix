{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.pulseaudio ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
  };
}
