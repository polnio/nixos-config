return {
  "chrishrb/gx.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  submodules = false,
  config = true,
  init = function()
    vim.g.netrw_nogx = 1
  end,
  cmd = "Browse",
  keys = { { 'gx', "<cmd>Browse<cr>", mode = { "n", "x" }, { silent = true } } }
}
