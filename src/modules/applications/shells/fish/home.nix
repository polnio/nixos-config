{ ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting
      set fish_color_param white
    '';
  };
}
