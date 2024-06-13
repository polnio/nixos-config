{ ... }: {
  os.programs.git.enable = true;
  hm.programs.git = {
    enable = true;
    userName = "Po Co";
    userEmail = "polniolino@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
      safe.directory = [ "/etc/nixos" ];
      push.autoSetupRemote = true;
    };
  };
}