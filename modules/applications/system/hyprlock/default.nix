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
        command = "${hmConfig.wayland.windowManager.hyprland.package}/bin/Hyprland";
        user = config.hmUsername;
      };
    };
  };

  os.environment.systemPackages = [ pkgs.hyprlock ];
  settings.autostart = [ "${pkgs.hyprlock}/bin/hyprlock" ];

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
