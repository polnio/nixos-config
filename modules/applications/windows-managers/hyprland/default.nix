{ pkgs, ... }: {
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

  os.environment.systemPackages = [ pkgs.hyprland ];
}
