return {}
--[[ return {
  "monaqa/dial.nvim",
  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<C-a>",
      -- require("dial.map").inc_normal(),
      function() require("dial.map").manipulate("decrement", "normal") end,
      { noremap = true, expr = true }
    )
  end,
  keys = {
    -- {
    --   "<C-a>",
    --   function() require("dial.map").manipulate("increment", "normal") end,
    --   noremap = true,
    --   -- function() return require("dial.map").inc_normal() end
    -- },
    "<C-a>",
    {
      "<C-x>",
      function() require("dial.map").manipulate("decrement", "normal") end
    },
    {
      "g<C-a>",
      function() require("dial.map").manipulate("increment", "gnormal") end
    },
    {
      "g<C-x>",
      function() require("dial.map").manipulate("decrement", "gnormal") end
    },
    {
      "<C-a>",
      function() require("dial.map").manipulate("increment", "visual") end,
      mode = "v"
    },
    {
      "<C-x>",
      function() require("dial.map").manipulate("decrement", "visual") end,
      mode = "v"
    },
    {
      "g<C-a>",
      function() require("dial.map").manipulate("increment", "gvisual") end,
      mode = "v"
    },
    {
      "g<C-x>",
      function() require("dial.map").manipulate("decrement", "gvisual") end,
      mode = "v"
    },
  }
} ]]
