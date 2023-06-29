-- base keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "gt", function()
  vim.cmd("tab split")
  vim.cmd("terminal")
end)

vim.keymap.set("i", "jj", "<Esc>")
