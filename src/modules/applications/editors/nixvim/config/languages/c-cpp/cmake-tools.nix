{ ... }:
{
  plugins.cmake-tools = {
    enable = true;
    lazyLoad.settings.ft = [
      "cmake"
      "c"
      "cpp"
    ];
  };
}
