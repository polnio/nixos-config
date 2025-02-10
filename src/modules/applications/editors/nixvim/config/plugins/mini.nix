{ ... }:
{
  plugins.mini = {
    enable = true;
    modules = {
      ai = { };
      align = { };
      bracketed = { };
      # snippets = {};
      diff = { };
      extra = { };
      files = { };
      icons = { };
      indentscope = { };
      move = { };
      pairs = { };
      pick = { };
      splitjoin = { };
      starter = {
        evaluate_single = true;
      };
      surround = { };
      trailspace = { };
      hipatterns = { };
    };
    luaConfig.post = "vim.ui.select = require('mini.pick').ui_select";
  };
}
