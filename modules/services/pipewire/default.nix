{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.pulseaudio ];
  os.services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
  };
}
