{
  config,
  ...
}:
{
  stylix.targets.hyprlock.enable = false;
  programs.hyprlock = {
    enable = true;
    settings = with config.stylix.base16Scheme; {
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
