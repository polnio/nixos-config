{ pkgs, ... }:
{
  settings = {
    keymaps = [
      {
        super = true;
        control = true;
        key = "D";
        command = "${pkgs.vesktop}/bin/vesktop";
      }
    ];
    autostart.vesktop = "${pkgs.vesktop}/bin/vesktop --start-minimized";
  };
}
