{ pkgs, ... }:
{
  vim.lazy.plugins."mini.nvim" = {
    package = pkgs.vimPlugins.mini-nvim;
    after = # lua
      ''
        require("mini.ai").setup()
        require("mini.align").setup()
        require("mini.bracketed").setup()
        -- require("mini.comment").setup()
        -- require("mini.completion").setup()
        -- require("mini.cursorword").setup()
        require("mini.diff").setup()
        require("mini.icons").setup()
        require("mini.indentscope").setup()
        require("mini.move").setup()
        require("mini.operators").setup()
        require("mini.pairs").setup()
        require("mini.splitjoin").setup()
        require("mini.starter").setup()
        require("mini.statusline").setup()
        require("mini.surround").setup()
        require("mini.tabline").setup()
        require("mini.trailspace").setup()
        local censor_extmark_opts = function(_, match, _)
          local mask = string.rep('x', vim.fn.strchars(match))
          return {
            virt_text = { { mask, 'Comment' } }, virt_text_pos = 'overlay',
            priority = 200, right_gravity = false,
          }
        end
        local hipatterns = require("mini.hipatterns")
        hipatterns.setup({
          highlighters = {
            fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
            todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
            note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
            censor = { pattern = 'password: ()%S+()', group = "", extmark_opts = censor_extmark_opts },
          }
        })
      '';
  };
}
