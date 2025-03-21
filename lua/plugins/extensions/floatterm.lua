-- Use (neo)vim terminal in the floating/popup window.

return {
  "voldikss/vim-floaterm",
  keys = {
    { '<leader>s', '<CMD>FloatermToggle<CR>', desc = " [s]hell toggle" }
  },
  config = function()
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9

    vim.cmd([[hi Floaterm guibg=black]])

    vim.keymap.set('t', '<C-d>', '<C-\\><C-n>:stopinsert<CR>')
  end
}
