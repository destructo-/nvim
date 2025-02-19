-- A pretty list for showing diagnostics, references, telescope results,
-- quickfix and location lists to help you solve all the trouble your code is causing.

return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  keys = {
    { "<leader>el", "<CMD>Trouble diagnostics toggle<CR>",     desc = "Error list toggle" },
    { "<leader>ej", "<CMD>lua vim.diagnostic.goto_next()<CR>", desc = "Go to next error" },
    { "<leader>ek", "<CMD>lua vim.diagnostic.goto_prev()<CR>", desc = "Go to previous error" }
  },
  config = function()
    require("trouble").setup()
  end
}
