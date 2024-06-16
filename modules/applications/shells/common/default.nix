{ ... }: {
  hm.home.shellAliases = {
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
    ga = "git add";
    gau = ''echo -e "a\n*\nq\n" | git add -i > /dev/null'';
    gaa = "git add -A";
    gs = "git status";
    gc = "EDITOR=nvim git commit";
    gd = "git diff";
    gp = "git push";
  };
}
