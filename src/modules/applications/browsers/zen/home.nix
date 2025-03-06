{ inputs, ... }:
let
  zenFolder = "/home/polnio/.zen";
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
  '';
  home.file."${zenFolder}/Default Profile/chrome" = {
    source = "${inputs.zen-browser-catppuccin}/themes/Mocha/Blue";
    recursive = true;
  };
}
