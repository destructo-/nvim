-- base keymaps
vim.g.mapleader = " "

-- vim.keymap.set("n", "gt", function()
--   vim.cmd("tab split")
--   vim.cmd("terminal")
-- end)

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<space>ne", function()
  vim.diagnostic.goto_next()
end)

vim.keymap.set("n", "<space>pe", function() 
  vim.diagnostic.goto_prev()
end)
