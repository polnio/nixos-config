{ pkgs, ... }:
{
  programs.neovim.enable = true;
  environment.systemPackages = with pkgs; [
    neovide
    typst
    (import ./nvims.nix { inherit pkgs; })
  ];
}
