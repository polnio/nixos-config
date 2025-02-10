{ ... }:
{
  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      update_events = [
        "TextChanged"
        "TextChangedI"
      ];
    };
    # fromLua = ../snippets;
  };
}
