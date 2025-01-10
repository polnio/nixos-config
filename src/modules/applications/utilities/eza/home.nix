{ ... }:
{
  programs.eza = {
    enable = true;
    enableNushellIntegration = false;
    git = true;
    icons = "always";
  };

  home.shellAliases = {
    l = "eza -la";
    ll = "eza -l";
  };
}
