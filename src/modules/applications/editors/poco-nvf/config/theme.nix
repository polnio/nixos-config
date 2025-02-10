{ ... }:
{
  vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    lsp.lsplines.enable = true;
    options.laststatus = 0;
    options.showmode = false;
    statusline.lualine.enable = true;
  };
}
