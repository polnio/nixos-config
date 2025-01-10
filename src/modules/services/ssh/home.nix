{ ... }:
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host atilla.org *.atilla.org
        ForwardAgent yes
        AddKeysToAgent yes
    '';
  };
}
