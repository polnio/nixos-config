{ ... }:
{
  plugins.supermaven = {
    enable = true;
    settings = {
      disable_inline_completion = true;
      keymaps = {
        accept_suggestion = "<C-z>";
        clear_suggestion = "<C-]>";
        accept_word = "<C-j>";
      };
      disable_keymaps = false;
    };
  };
  plugins.cmp.settings.sources = [ { name = "supermaven"; } ];
}
