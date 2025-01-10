{ settings, lib, ... }:
let
  autostart = lib.mapAttrs (name: value: {
    Unit = {
      Description = name;
      After = [
        "graphical-session-pre.target"
      ] ++ (lib.optional (value ? afterLogin && value.afterLogin) "login.service");
      Before = lib.optional (value ? beforeLogin && value.beforeLogin) "login.service";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      # type = "oneshot";
      ExecStart = if value ? command then value.command else value;
    };
    Install = {
      WantedBy = [
        "graphical-session.target"
      ];
    };
  }) settings.autostart;
in
{
  systemd.user.services = autostart // {
    login = {
      Unit = {
        Description = "Login";
      };
      Service = {
        Type = "oneshot";
        ExecStart = settings.commands.lock;
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
