{ pkgs, myUtils, ... }:
{
  settings = {
    commands = {
      applauncher = "${pkgs.ags}/bin/ags toggle -i astal app-launcher";
      shutdownConfirm = ''${pkgs.ags}/bin/ags toggle -i astal confirm-shutdown'';
    };
    keymaps = [
      {
        super = true;
        key = "Space";
        command = ''${pkgs.ags}/bin/ags -r "globalThis.keyboard.switchLayout()"'';
      }
      {
        key = "Caps_Lock";
        ignoreModifiers = true;
        repeat = false;
        lockscreen = true;
        release = true;
        command = ''${pkgs.ags}/bin/ags -r "globalThis.keyboard.toogleCapsLock()"'';
      }
      {
        key = "Num_Lock";
        ignoreModifiers = true;
        repeat = false;
        lockscreen = true;
        release = true;
        command = ''${pkgs.ags}/bin/ags -r "globalThis.keyboard.toogleNumLock()"'';
      }
      {
        key = "XF86Launch1";
        command = ''${pkgs.swaynotificationcenter}/bin/swaync-cliend -d'';
      }
    ];
    autostart.ags = {
      command = "${myUtils.getPackage "ags"}/bin/poco-machine-ags";
      beforeLogin = true;
      afterLogin = false;
    };
  };
}
