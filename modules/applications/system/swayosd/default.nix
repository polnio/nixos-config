{ pkgs, ... }:
{
  os.services.udev.packages = [ pkgs.swayosd ];
  hm.services.swayosd.enable = true;

  settings.keymaps = [
    {
      key = "XF86AudioRaiseVolume";
      command = "swayosd-client --output-volume raise";
      lockscreen = true;
    }
    {
      key = "XF86AudioLowerVolume";
      command = "swayosd-client --output-volume lower";
      lockscreen = true;
    }
    {
      key = "XF86AudioMute";
      command = "swayosd-client --output-volume mute-toggle";
      lockscreen = true;
    }
    {
      key = "XF86AudioMicMute";
      command = "swayosd-client --input-volume mute-toggle";
      lockscreen = true;
    }
    {
      key = "XF86MonBrightnessUp";
      command = "swayosd-client --brightness raise";
      lockscreen = true;
    }
    {
      key = "XF86MonBrightnessDown";
      command = "swayosd-client --brightness lower";
      lockscreen = true;
    }
  ];
}
