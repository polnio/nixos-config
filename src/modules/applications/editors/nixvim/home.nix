{
  myUtils,
  ...
}:
{
  home.shellAliases = {
    nn = "${myUtils.getPackage "nixvim"}/bin/nvim";
    ":q" = "exit";
  };
}
