return {
  "supermaven-inc/supermaven-nvim",
  event = "BufEnter",
  opts = {
    disable_inline_completion = true,
    keymaps = {
      accept_suggestion = "<C-z>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
    disable_keymaps = false
  }
}
