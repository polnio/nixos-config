{ pkgs, ... }:
{
  settings.keymaps = [
    {
      key = "XF86MonBrightnessDown";
      command = "${pkgs.light}/bin/light -U 5";
    }
    {
      key = "XF86MonBrightnessUp";
      command = "${pkgs.light}/bin/light -A 5";
    }
  ];
}
