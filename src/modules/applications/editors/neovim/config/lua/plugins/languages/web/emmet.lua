return {
  "mattn/emmet-vim",
  ft = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "astro",
    "vue",
    "php",
    "handlebars",
    "xml",
  },
  init = function()
    vim.g.user_emmet_leader_key = "<C-c>"
  end,
}
