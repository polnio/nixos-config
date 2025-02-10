{ ... }:
{
  plugins.crates = {
    enable = true;
    lazyLoad.settings.event = "BufRead Cargo.toml";
  };
}
