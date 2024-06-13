{ pkgs, ... }: {
  os.programs.adb.enable = true;
  os.environment.systemPackages = [ pkgs.scrcpy ];
}
