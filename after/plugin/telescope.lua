local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
  local ignore = { file_ignore_patterns = { 'target/' } }
  builtin.find_files(ignore)
end)

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>mc', '<cmd>Telescope metals commands<CR>')

