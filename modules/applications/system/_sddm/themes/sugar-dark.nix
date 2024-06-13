{ pkgs, inputs, lib, osConfig, ... }:
let
  theme = pkgs.stdenv.mkDerivation {
    name = "sddm-sugar-dark";
    src = inputs.sddm-sugar-dark;
    installPhase =
      "	sed -i -e 's/ForceHideCompletePassword=false/ForceHideCompletePassword=true/g' theme.conf\n	mkdir -p $out\n	cp -R ./* $out\n";
  };

  inherit (lib) mkOption mkIf types;

  cfg = osConfig.services.displayManager.sddm.themes.sugar-dark;
in {
  inputs = {
    sddm-sugar-dark = {
      url = "github:MarianArlt/sddm-sugar-dark";
      flake = false;
    };
  };

  options = {
    os.services.displayManager.sddm.themes.sugar-dark = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    os.services.displayManager.sddm = {
      theme = "${theme}";
      extraPackages = with pkgs; [
        libsForQt5.qt5.qtquickcontrols2
        libsForQt5.qt5.qtgraphicaleffects
      ];
    };
  };
}
