{ ... }:
{
  hm.programs.ssh = {
    enable = true;
    matchBlocks = {
      "gitlab.com" = {
        hostname = "altssh.gitlab.com";
        user = "git";
        port = 443;
        extraOptions = {
          PreferredAuthentications = "publickey";
        };
        identityFile = "~/.ssh/gitlab";
      };
    };
  };

}
