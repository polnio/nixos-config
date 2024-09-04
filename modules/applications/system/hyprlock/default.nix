{
  pkgs,
  osConfig,
  hmConfig,
  config,
  ...
}:
{
  os.services.greetd = {
    enable = true;
    settings = {
      default_session.command = "${pkgs.bash}/bin/bash";
      initial_session = {
        command = "${hmConfig.wayland.windowManager.hyprland.package}/bin/Hyprland >/dev/null 2>&1";
        user = config.hmUsername;
      };
    };
  };
  os.security.pam.services.greetd.enableGnomeKeyring = false;

  os.environment.systemPackages = [ pkgs.hyprlock ];
  settings.commands.lock = "${pkgs.hyprlock}/bin/hyprlock";

  os.security.pam.services.hyprlock.text = "auth include login";

  hm.programs.hyprlock = {
    enable = true;
    settings = with osConfig.stylix.base16Scheme; {
      shape = {
        color = "0xff${base00}";
        size = "500, 200";
        halign = "center";
        valign = "center";
        position = "0, 5";
        rounding = 20;
      };
      label = {
        text = "Entrez le mot de passe pour continuer";
        halign = "center";
        valign = "center";
        position = "0, 40";
      };
      input-field = {
        size = "200, 50";
        hide_input = false;
        placeholder_text = "Test";
      };
    };
  };
}
