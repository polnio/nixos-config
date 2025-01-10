{ inputs, ... }:
{
  stylix.targets.swaync.enable = false;
  services.swaync = {
    enable = true;
    style = inputs.catppuccin-swaync;
  };
}
