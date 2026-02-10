{ ... }:
{
  programs.ssh.enable = true;

  programs.ssh.matchBlocks."*" = {
    setEnv.TERM = "xterm-256color";
  };

  programs.fish.shellInit = ''
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  '';
}
