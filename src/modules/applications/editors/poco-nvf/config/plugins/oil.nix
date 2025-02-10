{ pkgs, ... }:
{
  vim.lazy.plugins."oil.nvim" = {
    package = pkgs.vimPlugins.oil-nvim;
    setupModule = "oil";
    keys = [
      {
        mode = "n";
        key = "-";
        action = ":Oil<CR>";
      }
    ];
  };
}
