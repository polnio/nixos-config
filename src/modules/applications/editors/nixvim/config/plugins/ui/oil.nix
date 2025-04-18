{ ... }:
{
  plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<cr>";
      options.silent = true;
    }
  ];
}
