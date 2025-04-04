{ ... }:
{
  plugins.mini = {
    enable = true;
    modules = {
      ai = { };
      align = { };
      bracketed = { };
      # snippets = {};
      diff = { };
      extra = { };
      files = { };
      icons = { };
      indentscope = { };
      move = { };
      pairs = { };
      pick = { };
      splitjoin = { };
      starter = {
        evaluate_single = true;
      };
      surround = { };
      trailspace = { };
      hipatterns = { };
    };
    luaConfig.post = "vim.ui.select = require('mini.pick').ui_select";
  };
  keymaps =
    let
      mkKeymap = keymap: {
        mode = "n";
        key = keymap.key;
        action = "<cmd>${keymap.action}<cr>";
        options.silent = true;
      };
    in
    [
      (mkKeymap {
        key = "<leader>ff";
        action = "Pick files";
      })
      (mkKeymap {
        key = "<leader>fo";
        action = "Pick oldfiles";
      })
      (mkKeymap {
        key = "<leader>fb";
        action = "Pick buffers";
      })
      (mkKeymap {
        key = "<leader>fw";
        action = "Pick grep_live";
      })
      (mkKeymap {
        key = "<leader>fd";
        action = "Pick diagnostics";
      })
      (mkKeymap {
        key = "z=";
        action = "Pick spellsuggest";
      })
      (mkKeymap {
        key = "gs";
        action = ''Pick lsp scope="workspace_symbol"'';
      })
      (mkKeymap {
        key = "-";
        action = "lua MiniFiles.open()";
      })
    ];
}
