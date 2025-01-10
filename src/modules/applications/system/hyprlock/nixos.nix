{
  pkgs,
  # config,
  hmConfig,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session.command = "${pkgs.bash}/bin/bash";
      initial_session = {
        command = "${hmConfig.wayland.windowManager.hyprland.package}/bin/Hyprland >/dev/null 2>&1";
        # user = config.hmUsername;
        user = "polnio";
      };
    };
  };
  security.pam.services.greetd.enableGnomeKeyring = false;

  environment.systemPackages = [ pkgs.hyprlock ];
  security.pam.services.hyprlock.text = "auth include login";
}
