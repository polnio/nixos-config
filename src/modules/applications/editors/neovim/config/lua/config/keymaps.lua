vim.keymap.set("n", "<Esc>", ":noh<cr>", { silent = true })
vim.keymap.set("n", "<C-s>", ":w<cr>", { silent = true, desc = "Save File" })
vim.keymap.set("n", "<leader>w", ":w<cr>", { silent = true, desc = "Save File" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { silent = true, desc = "Quit Neovim" })
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down", silent = true })
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up", silent = true })
-- vim.keymap.set("x", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down", silent = true })
-- vim.keymap.set("x", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up", silent = true })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode", silent = true })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode", silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left window", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right window", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to below window", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to above window", silent = true })
vim.keymap.set("n", "<leader>a", "gg0vG$", { desc = "Select All" })

vim.keymap.set("i", "<C-e>", function()
  print(vim.api.nvim_eval("typst#in_math()"))
end, {})

vim.keymap.set("n", "<leader>t", function()
  vim.loop.spawn("kitty", {
    args = { "-d", vim.fn.getcwd() },
  })
end, { desc = "Open terminal" })

require("which-key").add {
  { "<leader>b", group = "Buffers" },
  { "<leader>f", group = "Find" },
  { "<leader>l", group = "LSP" },
}

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
