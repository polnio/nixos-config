{ inputs, ... }:
{
  inputs.catppuccin-swaync = {
    url = "https://github.com/catppuccin/swaync/releases/latest/download/mocha.css";
    flake = false;
  };
  hm.services.swaync = {
    enable = true;
    style = inputs.catppuccin-swaync;
  };
}
