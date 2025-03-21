-- A pretty list for showing diagnostics, references, telescope results,
-- quickfix and location lists to help you solve all the trouble your code is causing.

return {
  -- A pretty list for showing diagnostics, references, telescope results,
  -- quickfix and location lists to help you solve all the trouble your code is causing.
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    keys = {
      { "<leader>de", "<CMD>Trouble diagnostics toggle<CR>", desc = " [e]rror list toggle" },
    },
    config = function()
      require("trouble").setup()
    end
  }
}
