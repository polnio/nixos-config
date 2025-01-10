{ hmConfig, ... }:
let
  agsPackage = hmConfig.programs.ags.finalPackage;
in
{
  settings = {
    commands = {
      applauncher = "${agsPackage}/bin/ags toggle app-launcher";
      shutdownConfirm = ''${agsPackage}/bin/ags toggle confirm-shutdown'';
    };
    keymaps = [
      {
        super = true;
        key = "Space";
        command = ''${agsPackage}/bin/ags -r "globalThis.keyboard.switchLayout()"'';
      }
      {
        key = "Caps_Lock";
        ignoreModifiers = true;
        repeat = false;
        lockscreen = true;
        release = true;
        command = ''${agsPackage}/bin/ags -r "globalThis.keyboard.toogleCapsLock()"'';
      }
      {
        key = "Num_Lock";
        ignoreModifiers = true;
        repeat = false;
        lockscreen = true;
        release = true;
        command = ''${agsPackage}/bin/ags -r "globalThis.keyboard.toogleNumLock()"'';
      }
    ];
    autostart.ags = {
      command = "${agsPackage}/bin/ags run";
      beforeLogin = true;
      afterLogin = false;
    };
  };
}
