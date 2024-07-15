{ ... }: {
  os.programs.geary.enable = true;

  settings.windows.noBar = [ "geary" ];
}
