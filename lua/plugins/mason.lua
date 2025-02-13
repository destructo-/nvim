-- Neovim plugin that allows you to easily manage external editor tooling such as LSP servers,
-- DAP servers, linters, and formatters through a single interface.

require("mason").setup()

local wk = require("which-key")

wk.add {
  {
    '<leader>om',
    '<CMD>:Mason<CR>',
    desc = "Mason language servers manager"
  },
}

-- vim.api.nvim_buf_get_option
-- vim.print(vim.print(vim.fn.bufexists(7) and vim.api.nvim_get_option_value('filetype', { buf = 7 }))
