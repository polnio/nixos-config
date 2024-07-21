{
  pkgs,
  osConfig,
  lib,
  inputs,
  config,
  ...
}:
let
  agsPackage = inputs.ags.packages.${pkgs.system}.default;
in
{
  inputs = {
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  hmModules = [ inputs.ags.homeManagerModules.default ];

  os.environment.systemPackages = [
    pkgs.acpi
    inputs.ags.packages.${pkgs.system}.default
  ];

  os.environment.pathsToLink = [ "/share/com.github.Aylur.ags" ];
  hm.programs.ags = {
    enable = true;
    configDir = ./config;

    extraPackages = with pkgs; [
      acpi
      accountsservice
      gtksourceview
      webkitgtk
    ];
  };

  hm.xdg.dataFile."ags/colors.json".text = builtins.toJSON (
    lib.attrsets.mapAttrs (name: value: "#${value}") osConfig.stylix.base16Scheme
  );

  hm.programs.git = {
    extraConfig = {
      safe.directory = [ "${config.settings.os-config.path}/modules/applications/utilities/ags/config" ];
    };
  };

  settings = {
    commands = {
      applauncher = "${agsPackage}/bin/ags -t applauncher";
      shutdownConfirm = ''${agsPackage}/bin/ags -r "globalThis.confirmSubject.setValue('shutdown')"'';
    };
    keymaps = [
      {
        super = true;
        key = "Space";
        command = ''${agsPackage}/bin/ags -r "globalThis.keyboard.switchLayout()"'';
      }
      {
        key = "Caps_Lock";
        ignoreModifiers = true;
        repeat = false;
        command = ''${agsPackage}/bin/ags -r "globalThis.keyboard.toogleCapsLock()"'';
      }
      {
        key = "Num_Lock";
        ignoreModifiers = true;
        repeat = false;
        command = ''${agsPackage}/bin/ags -r "globalThis.keyboard.toogleNumLock()"'';
      }
    ];
    autostart = [
      {
        command = "ags -q; ags";
        allowReload = true;
      }
    ];
  };
}
