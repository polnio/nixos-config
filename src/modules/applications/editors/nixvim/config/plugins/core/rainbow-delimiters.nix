{ ... }:
{
  plugins.rainbow-delimiters = {
    enable = true;
    # lazyLoad.settings.event = "BufRead";
    strategy = {
      default = "global";
      vim = "local";
    };
    query = {
      default = "rainbow-delimiters";
      lua = "rainbow-blocks";
    };
    highlight = [
      "RainbowDelimiterRed"
      "RainbowDelimiterYellow"
      "RainbowDelimiterBlue"
      "RainbowDelimiterOrange"
      "RainbowDelimiterGreen"
      "RainbowDelimiterViolet"
      "RainbowDelimiterCyan"
    ];
    /*
      settings = {
        priority = {
          default = 110;
          lua = 210;
        };
      };
    */
  };
}
