{ pkgs, osConfig, ... }:
{
  settings.autostart.swaybg = "${pkgs.swaybg}/bin/swaybg -i ${osConfig.stylix.image}";
}
