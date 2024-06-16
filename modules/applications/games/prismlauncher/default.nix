{ pkgs, inputs, ... }: {
  inputs = {
    prismlauncher-catppuccin = {
      url =
        "https://github.com/PrismLauncher/Themes/releases/latest/download/Catppuccin-Mocha-theme.zip";
      flake = false;
    };
  };

  os.environment.systemPackages = [ pkgs.prismlauncher ];

  hm.xdg.dataFile."PrismLauncher/themes/Catppuccin-Mocha" = {
    source = "${inputs.prismlauncher-catppuccin}/Catppuccin-Mocha";
    recursive = true;
  };
}
