{ inputs, lib, ... }:
let
  catppuccinConfig = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };
in {
  inputs.blackbox = {
    url = "github:catppuccin/blackbox";
    flake = false;
  };

  inputs.catppuccin.url = "github:catppuccin/nix";
  osModules = [ inputs.catppuccin.nixosModules.catppuccin ];
  hmModules = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  os.catppuccin = catppuccinConfig;
  hm.catppuccin = catppuccinConfig;

  hm.wayland.windowManager.hyprland.settings = {
    general = {
      "col.active_border" = "$accent";
      "col.inactive_border" = "$base";
    };
    plugin = {
      hy3.tabs = {
        "col.inactive" = "$base";
        "col.text.inactive" = "$text";
        "col.active" = "$accent";
      };
    };
  };

  hm.xdg.dataFile."blackbox/schemes/Catppuccin-Mocha.json".source =
    "${inputs.blackbox}/src/Catppuccin-Mocha.json";

  hm.dconf.settings."com/raggesilver/BlackBox" = with lib.gvariant; {
    # font = "${osConfig.stylix.fonts.monospace.name} Bold 10";
    pretty = false;
    style-preference = mkUint32 2;
    theme-dark = "Catppuccin-Mocha";

    use-custom-command = true;
    custom-shell-command = "${pkgs.zsh}/bin/zsh";
    use-sixel = true;
    was-maximized = true;
    terminal-bell = false;
    context-aware-header-bar = false;
  };
}
