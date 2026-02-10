{ ... }:
{
  plugins.mini = {
    enable = true;
    modules = {
      ai = { };
      align = { };
      bracketed = { };
      diff = { };
      extra = { };
      icons = { };
      indentscope = { };
      move = { };
      pairs = { };
      splitjoin = { };
      surround = { };
      trailspace = { };
    };
    luaConfig.post = "vim.ui.select = require('mini.pick').ui_select";
  };
}
