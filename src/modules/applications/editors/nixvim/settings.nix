{ myUtils, settings, ... }:
{
  settings = {
    commands.editor = "${settings.commands.terminal} ${myUtils.getPackage "nixvim"}/bin/nvim";
  };
}
