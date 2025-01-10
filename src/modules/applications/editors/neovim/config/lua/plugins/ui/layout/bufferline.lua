return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = true,
  event = "VeryLazy",
  init = function()
    vim.cmd [[
			augroup MyColors
			autocmd!
			autocmd ColorScheme * highlight BufferLineFill guibg=#1e1e2e
			autocmd ColorScheme * highlight BufferLineSeparator guifg=#1e1e2e
			autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=#1e1e2e
			augroup END
		]]
  end,
  keys = {
    -- { "[b", ":bp<cr>", desc = "Previous buffer", silent = true },
    -- { "]b", ":bn<cr>", desc = "Next buffer", silent = true },
    {
      "<leader>bf",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find buffer",
      silent = true,
    },
    -- { "<leader>bb", ":b#<cr>",  desc = "Last buffer",   silent = true },
    { "<leader>bd", ":bd<cr>",  desc = "Delete buffer", silent = true },
    { "<leader>bD", ":%bd<cr>", desc = "Delete buffer", silent = true },
  },
}
