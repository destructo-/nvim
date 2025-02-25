-- Extensible UI for Neovim notifications and LSP progress messages.

return {
  "j-hui/fidget.nvim",
  keys = {
    { "<leader>en", "<CDM>:Fidget history<CR>", desc = "Notifications history" }
  },
  init = function()
    require("fidget").setup({
      notification = {
        override_vim_notify = true
      }
    })
  end
}
