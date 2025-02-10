{ ... }:
{
  plugins.package-info = {
    enable = true;
    # enableTelescope = true;
    lazyLoad.settings.event = "BufRead package.json";
  };
}
