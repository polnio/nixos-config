{
  pkgs,
  lib,
  config,
  settings,
  inputs,
  ...
}:
{
  programs.ags = {
    enable = true;
    # package = inputs.ags.packages.${pkgs.system}.agsFull;
    # package = pkgs.ags;
    configDir = ./config;
    # systemd.enable = true;

    extraPackages =
      with pkgs;
      [
        acpi
        accountsservice
        gtksourceview
        webkitgtk
      ]
      ++ (with inputs.ags.packages.${pkgs.system}; [
        hyprland
        wireplumber
        bluetooth
        network
        battery
        tray
        apps
      ]);
  };

  xdg.dataFile."colors.json".text = builtins.toJSON (
    lib.attrsets.mapAttrs (name: value: "#${value}") config.stylix.base16Scheme
  );

  programs.git = {
    extraConfig = {
      safe.directory = [ "${settings.os-config.path}/modules/applications/utilities/ags/config" ];
    };
  };
}
