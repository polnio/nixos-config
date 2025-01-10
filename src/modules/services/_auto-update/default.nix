{ settings, ... }:
{
  os.systemd.timers.update-system = {
    description = "Update system";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
      Unit = "update-system.service";
    };
  };

  os.systemd.services.update-system = {
    description = "Update system";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = settings.commands.updateSystem;
    };
  };

}
