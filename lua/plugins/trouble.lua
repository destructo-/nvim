-- A pretty list for showing diagnostics, references, telescope results,
-- quickfix and location lists to help you solve all the trouble your code is causing.

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name }
  }
end

local configuration = {
  win = {
    wo = {
      colorcolumn = ''
    }
  }
}

require("trouble").setup(configuration)

-- local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
vim.diagnostic.config {
  float = { border = border "CmpDocumentationBorder" },
  virtual_text = {
    prefix = '●',
  }
}

local wk = require("which-key")
wk.add {
  {
    "<leader>el",
    "<cmd>Trouble diagnostics toggle<CR>",
    desc = "Error list toggle",
  },
  {
    "<leader>ej",
    "<cmd>lua vim.diagnostic.goto_next()<CR>",
    desc = "Go to next error",
  },
  {
    "<leader>ek",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    desc = "Go to previous error",
  },
}
