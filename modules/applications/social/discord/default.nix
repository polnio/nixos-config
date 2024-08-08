{ pkgs, inputs, ... }:
{
  inputs.catppuccin-discord = {
    url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css";
    flake = false;
  };

  os.environment.systemPackages = [ pkgs.vesktop ];

  hm.xdg.configFile."vesktop/themes/catppuccin.theme.css".source = inputs.catppuccin-discord;

  settings = {
    keymaps = [
      {
        super = true;
        control = true;
        key = "D";
        command = "${pkgs.vesktop}/bin/vesktop";
      }
    ];
    autostart = [ "${pkgs.vesktop}/bin/vesktop --start-minimized" ];
  };
}
