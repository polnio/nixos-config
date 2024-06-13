{ pkgs, inputs, ... }: {
  inputs.hyprland.url = "github:hyprwm/Hyprland?ref=v0.39.1";
  # inputs.hyprland.url = "github:hyprwm/Hyprland?ref=v0.40.0";
  # hmModules = [ inputs.hyprland.homeManagerModules.default ];
  imports = [
    ./animations.nix
    ./bind.nix
    ./decoration.nix
    ./env.nix
    ./exec.nix
    ./general.nix
    ./gestures.nix
    ./input.nix
    ./misc.nix
    ./monitor.nix
    ./setup.nix
    ./vars.nix
    ./windowrule.nix
  ];

  os.environment.systemPackages =
    [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
}
