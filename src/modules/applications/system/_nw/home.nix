{
  pkgs,
  settings,
  ...
}:
{
  programs.nw = {
    enable = true;
    settings = {
      general = {
        shell = "${pkgs.bash}/bin/bash";
        interactive_shell = "${pkgs.fish}/bin/fish";
        ui = true;
      };
      nix.os_flake = settings.os-config.flake;
    };
    withUI = true;
  };

  home.shellAliases = {
    nt = "nw os build -a";
    ns = "nw os build -ab";
    nb = "nw os build -b";
    nc = "nw os clean";
    nu = "nw os update";
  };
  # settings.commands.updateSystem = "nw os update";
}
