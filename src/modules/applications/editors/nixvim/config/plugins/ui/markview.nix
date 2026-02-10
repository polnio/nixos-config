{ ... }:
{
  plugins.markview = {
    enable = true;
    settings = {
      preview.icon_provider = "mini";
    };
  };
  keymaps = [
    {
      key = "<leader>m";
      action = ":Markview toggle<cr>";
      options.silent = true;
      options.desc = "Markview";
    }
  ];
}
