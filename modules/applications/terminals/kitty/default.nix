{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.kitty ];
  hm.programs.kitty = {
    enable = true;
    #   font.name = "JetBrainsMono NF";
    # theme = "Catppuccin-Mocha";
    settings = { shell = "${pkgs.zsh}/bin/zsh"; };
  };
}
