return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = true,
  },
  event = "VimEnter",
  cmd = "Oil",

  keys = { { '-', "<cmd>Oil<cr>", { silent = true } } }
}
