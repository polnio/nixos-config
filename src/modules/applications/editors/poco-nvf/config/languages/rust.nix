{ pkgs, ... }:
{
  vim = {
    extraPackages = with pkgs; [
      cargo
      rustc
      rustfmt
      cargo-nextest
    ];
    languages.rust.enable = true;
  };
}
