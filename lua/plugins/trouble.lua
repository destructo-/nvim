-- A pretty list for showing diagnostics, references, telescope results,
-- quickfix and location lists to help you solve all the trouble your code is causing.

return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>el", "<cmd>Trouble diagnostics toggle<CR>",     desc = "Error list toggle" },
    { "<leader>ej", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Go to next error" },
    { "<leader>ek", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Go to previous error" }
  },
  init = function()
    require("trouble").setup()
  end
}
