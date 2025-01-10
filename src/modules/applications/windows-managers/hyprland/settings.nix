{ pkgs, ... }:
{
  settings = {
    commands.screenshot = {
      region = ''${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f -'';
      full = ''${pkgs.grim}/bin/grim - | ${pkgs.swappy}/bin/swappy -f -'';
    };
  };
}
