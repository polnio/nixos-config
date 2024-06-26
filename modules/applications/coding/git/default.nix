{ configDir, ... }: {
  os.programs.git.enable = true;
  hm.programs.git = {
    enable = true;
    userName = "Po Co";
    userEmail = "polniolino@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
      safe.directory = [ configDir ];
      push.autoSetupRemote = true;
    };
  };

  hm.home.shellAliases = {
    g = "git";
    ga = "git add";
    gau = ''echo -e "a\n*\nq\n" | git add -i > /dev/null'';
    gaa = "git add -A";
    gr = "git restore";
    gs = "git status";
    gc = "EDITOR=nvim git commit";
    gd = "git diff";
    gds = "git diff --staged";
    gp = "git push";
  };
}
