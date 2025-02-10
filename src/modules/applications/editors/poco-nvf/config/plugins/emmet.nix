{ pkgs, ... }:
{
  vim.lazy.plugins."emmet-vim" = {
    package = pkgs.vimPlugins.emmet-vim;
    before = # lua
      ''
        vim.g.user_emmet_leader_key = '<C-c>'
      '';
  };
}
