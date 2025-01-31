-- A pretty list for showing diagnostics, references, telescope results,
-- quickfix and location lists to help you solve all the trouble your code is causing.

local configuration = {
  win = {
    wo = {
      colorcolumn = ''
    }
  }
}

require("trouble").setup(configuration)

local wk = require("which-key")
wk.add {
  {
    "<leader>xx",
    "<cmd>Trouble diagnostics toggle<CR>",
    desc = "Diagnostic toggle",
  },
  {
    "<leader>xj",
    "<cmd>lua vim.diagnostic.goto_next()<CR>",
    desc = "Diagnostic go to next",
  },
  {
    "<leader>xk",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    desc = "Diagnostic go to previous",
  },
}
