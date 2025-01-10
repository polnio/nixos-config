{ pkgs, ... }:
{
  programs.neovim.enable = true;
  environment.systemPackages = with pkgs; [
    neovide
    (import ./nvims.nix { inherit pkgs; })
  ];
}
