{ ... }:
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = ":noh<CR>";
      options.silent = true;
    }
    {
      key = "<C-s>";
      action = ":w<CR>";
      options.silent = true;
      options.desc = "Save File";
    }
    {
      key = "<leader>w";
      action = ":w<CR>";
      options.silent = true;
      options.desc = "Save File";
    }
    {
      key = "<leader>q";
      action = ":q<CR>";
      options.silent = true;
      options.desc = "Quit Neovim";
    }
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
      callback.__raw = "function() vim.highlight.on_yank() end";
      group = "YankHighlight";
      pattern = "*";
    }
  ];
}
