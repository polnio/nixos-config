{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      # shell = "${pkgs.fish}/bin/fish";
      shell = "${pkgs.tmux}/bin/tmux";
      # shell = "${pkgs.nushell}/bin/nu";
      font_size = 11;
    };
  };
}
