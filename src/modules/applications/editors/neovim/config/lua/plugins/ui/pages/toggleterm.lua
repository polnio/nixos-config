return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  init = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new {
      cmd = "lazygit",
      hidden = true,
      direction = "float",
    }

    local lazygit_toggle = function()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>g", lazygit_toggle, { noremap = true, silent = true })
  end,
}
