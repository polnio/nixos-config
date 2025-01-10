return {
  "Exafunction/codeium.vim",
  enabled = false,
  event = "BufRead",
  init = function()
    vim.g.codeium_bin = "/run/current-system/sw/bin/codeium_language_server"
  end,
  keys = {
    {
      "<C-z>",
      vim.fn["codeium#Accept"],
      mode = "i",
      desc = "Codeium Accept",
      expr = true,
      silent = true,
    },
  },
}
