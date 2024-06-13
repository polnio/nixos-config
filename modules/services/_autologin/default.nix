{ pkgs, config, ... }: {
  os.systemd.targets."autologin-tty1" = {
    description = "Final";
    requires = [ "multi-user.target" ];
    after = [ "multi-user.target" ];
    unitConfig = { AllowIsolate = "yes"; };
  };
  os.systemd.services."supress-kernel-logging" = {
    description = "Suppress kernel logging to the console";
    after = [ "multi-user.target" ];
    wantedBy = [ "autologin-tty1.target" ];
    serviceConfig = {
      ExecStart = [ "${pkgs.utillinux}/sbin/dmesg -n 1" ];
      Type = "oneshot";
    };
  };
  os.systemd.services."autovt@tty1" = {
    description = "Autologin on TTY1";
    after = [ "supress-kernel-logging.service" ];
    wantedBy = [ "autologin-tty1.target" ];
    restartIfChanged = false;
    serviceConfig = {
      ExecStart = [
        "" # override upstream default with an empty ExecStart
        "@${pkgs.utillinux}/sbin/agetty agetty --login-program ${pkgs.shadow}/bin/login --autologin ${config.hmUsername} --noclear %I ${pkgs.bash}/bin/bash"
      ];
      Restart = "always";
      Type = "idle";
    };
  };
}
