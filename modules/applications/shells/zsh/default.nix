{ pkgs, ... }: {
  os.environment.systemPackages = [ pkgs.zsh ];
  hm.programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char

      # This function is called whenever a command is not found.
      # command_not_found_handler() {
      #   ${pkgs.comma}/bin/comma "$@"
      # }
      command_not_found_handler() {
        command-not-found "$1"
      }

      nss() {
        nix shell "nixpkgs#$1" -c ${pkgs.zsh}/bin/zsh
      }
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
    plugins = [
      {
        file = "powerlevel10k.zsh-theme";
        name = "powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
      }
      {
        file = ".p10k.zsh";
        name = "powerlevel10k-config";
        src = ./.;
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
    ];
  };
  os.environment.pathsToLink = [ "/share/zsh" ];
}
