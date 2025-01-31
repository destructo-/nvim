-- base keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<m-h>", "<C-w>h", opts)
vim.keymap.set("n", "<m-j>", "<C-w>j", opts)
vim.keymap.set("n", "<m-k>", "<C-w>k", opts)
vim.keymap.set("n", "<m-l>", "<C-w>l", opts)
vim.keymap.set("n", "<m-tab>", "<c-6>", opts)

vim.keymap.set("i", "jj", "<Esc>")
