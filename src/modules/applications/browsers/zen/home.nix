{ inputs, ... }:
let
  zenFolder = "/home/polnio/.zen";
  profileId = "DB53FBAB2B5A51EE";
in
{
  home.file."${zenFolder}/profiles.ini".text = ''
    [Profile0]
    Name=Default Profile
    IsRelative=1
    Path=Default Profile
    Default=1

    [General]
    StartWithLastProfile=1
    Version=2

    [Install${profileId}]
    Default=Default Profile
    Locked=1
  '';
  home.file."${zenFolder}/Default Profile/chrome" = {
    source = "${inputs.zen-browser-catppuccin}/themes/Mocha/Blue";
    recursive = true;
  };
}
