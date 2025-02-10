{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.typst-preview-nvim ];
  extraConfigLua = # lua
    ''
      require("typst-preview").setup()
    '';
}
