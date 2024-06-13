{ ... }: {
  os.programs.fish = { enable = true; };
  hm.programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting
      set fish_color_param white
    '';
    shellAliases = {
      l = "eza -la";
      ll = "eza -l";
      zp = "z ~/Documents/prog";
      zt = "z ~/Documents/prog/test";
      n = "nvim";
      nt = "nh os test";
      ns = "nh os switch";
      nb = "nh os boot";
      # nt = "sudo nixos-rebuild test";
      # ns = "sudo nixos-rebuild switch";
      # nb = "sudo nixos-rebuild boot";
      nc = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot";
    };
  };
}
