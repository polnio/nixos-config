{ inputs, ... }:
{

  xdg.dataFile."PrismLauncher/themes/Catppuccin-Mocha" = {
    source = "${inputs.prismlauncher-catppuccin}/Catppuccin-Mocha";
    recursive = true;
  };
}
