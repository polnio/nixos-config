{ ... }:
{
  vim.binds.whichKey.enable = true;
  vim.maps = {
    normal = {
      "<Esc>" = {
        action = ":noh<CR>";
        silent = true;
      };
      "C-s" = {
        action = ":w<CR>";
        silent = true;
        desc = "Save File";
      };
      "<leader>w" = {
        action = ":w<CR>";
        silent = true;
        desc = "Save File";
      };
      "<leader>q" = {
        action = ":q<CR>";
        silent = true;
        desc = "Quit";
      };
      "<leader>a" = {
        action = "gg0vG$";
        desc = "Select All";
      };
    };
    insert = {
      "jj" = {
        action = "<Esc>";
        desc = "Exit insert mode";
        silent = true;
      };
      "jk" = {
        action = "<Esc>";
        desc = "Exit insert mode";
        silent = true;
      };
    };
  };
  vim.luaConfigRC.yankHyghlight = # lua
    ''
      local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
      vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
          vim.highlight.on_yank()
        end,
        group = highlight_group,
        pattern = "*",
      })
    '';
}
