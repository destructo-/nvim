-- Use (neo)vim terminal in the floating/popup window.

vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

vim.cmd([[hi Floaterm guibg=black]])

vim.keymap.set('t', '<C-d>', '<C-\\><C-n>:stopinsert<CR>')
vim.keymap.set('n', '<C-d>', '<CMD>FloatermHide<CR>')

local wk = require("which-key")

wk.add {
  {
    '<leader>s',
    '<CMD>FloatermToggle<CR>',
    desc = "Toggle terminal shell"
  }
}
