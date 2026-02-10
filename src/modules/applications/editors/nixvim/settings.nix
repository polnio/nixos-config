{ myUtils, settings, ... }:
{
  settings = {
    commands.termeditor = "${myUtils.getPackage "nixvim"}/bin/nvim";
    commands.editor = "${settings.commands.terminal} ${settings.commands.termeditor}";
  };
}
