{ pkgs, osConfig, lib, inputs, configDir, ... }: {
  inputs = {
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  hmModules = [ inputs.ags.homeManagerModules.default ];

  os.environment.systemPackages =
    [ pkgs.acpi inputs.ags.packages.${pkgs.system}.default ];

  os.environment.pathsToLink = [ "/share/com.github.Aylur.ags" ];
  hm.programs.ags = {
    enable = true;
    configDir = ./config;

    extraPackages = with pkgs; [ acpi accountsservice gtksourceview webkitgtk ];
  };

  hm.xdg.dataFile."ags/colors.json".text = builtins.toJSON
    (lib.attrsets.mapAttrs (name: value: "#${value}")
      osConfig.stylix.base16Scheme);

  hm.programs.git = {
    extraConfig = {
      safe.directory =
        [ "${configDir}/modules/applications/utilities/ags/config" ];
    };
  };
}
