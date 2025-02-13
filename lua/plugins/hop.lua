-- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.


local configuration = { keys = 'etovxqpdygfblzhckisuran' }

require('hop').setup(configuration)

vim.keymap.set('n', 'f', "<CMD>:HopWord<CR>", { desc = 'Move to by HopWord', remap = true })
