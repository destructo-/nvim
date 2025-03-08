return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  keys = {
    { "<leader>aa", "<CMD>Copilot auth<CR>",   desc = " [a]uth and run" },
    { "<leader>as", "<CMD>Copilot toggle<CR>", desc = " [s]ession toggle" }
  },
  event = "InsertEnter",
  config = function()
    require("copilot").setup({})
  end,
}
