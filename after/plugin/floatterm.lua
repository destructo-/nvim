vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

vim.cmd([[hi Floaterm guibg=black]])

vim.keymap.set('n', '<leader>gt', ':FloatermToggle<CR>')
vim.keymap.set('t', '<C-d>', '<C-\\><C-n>:stopinsert<CR>')
vim.keymap.set('n', '<C-d>', ':FloatermHide<CR>')
