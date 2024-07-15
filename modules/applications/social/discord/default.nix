{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.vesktop ];
  settings = {
    keymaps = [
      {
        super = true;
        control = true;
        key = "D";
        command = "${pkgs.vesktop}/bin/vesktop";
      }
    ];
    autostart = [ "${pkgs.vesktop}/bin/vesktop --start-minimized" ];
  };
}
