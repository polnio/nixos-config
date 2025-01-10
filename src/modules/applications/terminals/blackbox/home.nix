{
  pkgs,
  lib,
  osConfig,
  inputs,
  ...
}:
{
  xdg.dataFile."blackbox/schemes/Catppuccin-Mocha.json".source = "${inputs.blackbox-catppuccin}/src/Catppuccin-Mocha.json";

  dconf.settings."com/raggesilver/BlackBox" = with lib.gvariant; {
    font = "${osConfig.stylix.fonts.monospace.name} Bold 10";
    pretty = false;
    style-preference = mkUint32 2;
    theme-dark = "Catppuccin-Mocha";

    use-custom-command = true;
    custom-shell-command = "${pkgs.fish}/bin/fish";
    use-sixel = true;
    was-maximized = true;
    terminal-bell = false;
    context-aware-header-bar = false;
  };
}
