vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'remove some editor options from chat window',
  pattern = 'copilot-*',
  group = vim.api.nvim_create_augroup('setup-vopilot-chat-view', { clear = true }),
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0
    vim.opt_local.list = false
  end
})

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = {
      { "<leader>ac", "<CMD>CopilotChatToggle<CR>",  desc = " [c]hat toggle" },
      { "<leader>aC", "<CMD>CopilotChatReset<CR>",   desc = " [C]lear chat" },
      { "<leader>ap", "<CMD>CopilotChatPrompts<CR>", desc = " [p]rompts list" },
      { "<leader>am", "<CMD>CopilotChatMpdels<CR>", desc = " [m]odels list" },
    },
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      question_header = '  ', -- Header to use for user questions
      answer_header = '  ', -- Header to use for AI answers
      error_header = '  ', -- Header to use for errors
      separator = '───', -- Separator to use in chat
    },
  },
}
