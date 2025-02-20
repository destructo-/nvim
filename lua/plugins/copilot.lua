return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  keys = {
    { "<leader>ac", "<CMD>Copilot auth<CR>",   desc = "Copilot auth and run" },
    { "<leader>at", "<CMD>Copilot toggle<CR>", desc = "Copilot toggle" }
  },
  event = "InsertEnter",
  config = function()
    require("copilot").setup({})
  end,
}
