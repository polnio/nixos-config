{ ... }:
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps = [
    {
      key = "<leader>a";
      action = "gg0vG$";
      options.desc = "Select All";
    }
    {
      mode = "i";
      key = "jj";
      action = "<Esc>";
      options.desc = "Exit insert mode";
      options.silent = true;
    }
    {
      mode = "i";
      key = "jk";
      action = "<Esc>";
      options.desc = "Exit insert mode";
      options.silent = true;
    }
  ];

  autoGroups.YankHighlight.clear = true;
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = "function() vim.hl.on_yank() end";
      group = "YankHighlight";
      pattern = "*";
    }
  ];
}
