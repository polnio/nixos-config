{ ... }:
{
  plugins.zen-mode = {
    enable = true;
    lazyLoad.settings.cmd = "ZenMode";
  };
  keymaps = [
    {
      key = "<leader>z";
      action = ":ZenMode<cr>";
      options.silent = true;
      options.desc = "Zen Mode";
    }
  ];
}
