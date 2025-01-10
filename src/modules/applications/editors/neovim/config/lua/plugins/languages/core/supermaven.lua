return {
  "supermaven-inc/supermaven-nvim",
  event = "BufEnter",
  opts = {
    keymaps = {
      accept_suggestion = "<C-z>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
    disable_keymaps = false
  }
}
