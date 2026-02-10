{ pkgs, ... }:
{
  opts = {
    # number = true;
    # relativenumber = true;
    mouse = "nv";
    clipboard = "unnamedplus";
    undofile = true;
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";
    updatetime = 250;
    timeoutlen = 300;
    completeopt = "menuone,noselect";
    shiftwidth = 2;
    tabstop = 2;
    softtabstop = 2;
    expandtab = true;
    wrap = false;
    showmode = false;
    termguicolors = true;
    conceallevel = 3;
    guifont = "JetBrainsMono Nerd Font:h11";
    title = true;
    titlestring = "%{v:progname} %f";
    findfunc = "v:lua.Fd_findfunc";
    foldlevelstart = 99;
  };
  extraConfigVim = "set shm+=I";
  extraConfigLuaPre = # lua
    ''
      function _G.Fd_findfunc(cmdarg, _cmdcomplete)
        local files = vim.fn.systemlist({ "${pkgs.fd}/bin/fd", "-t", "f", "--hidden", "--color=never", "-E", ".git" })
        if #cmdarg == 0 then
          return files
        else
          return vim.fn.matchfuzzy(files, cmdarg)
        end
      end
    '';
}
