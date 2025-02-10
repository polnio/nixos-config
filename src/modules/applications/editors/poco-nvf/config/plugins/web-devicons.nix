{ pkgs, ... }:
{
  vim.lazy.plugins."nvim-web-devicons" = {
    package = pkgs.vimPlugins.nvim-web-devicons;
  };
}
