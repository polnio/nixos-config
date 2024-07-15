{ ... }: {
  os.programs.evince.enable = true;

  settings.windows.noBar = [ "evince" ];
}
