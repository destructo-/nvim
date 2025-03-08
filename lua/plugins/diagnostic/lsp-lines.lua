return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = { "LspAttach" },
  keys = {
    { "<leader>dj", "<CMD>lua vim.diagnostic.goto_next({ float = false })<CR>", desc = " [j] next error" },
    { "<leader>dk", "<CMD>lua vim.diagnostic.goto_prev({ float = false })<CR>", desc = " [k] previous error" }
  },
  config = function()
    vim.diagnostic.config({
      -- float = { border = border "CmpDocumentationBorder" },
      float = false,
      virtual_text = {
        prefix = '●',
        format = function()
          return "󱞥 "
        end
      },
      -- virtual_lines = true,
      virtual_lines = { only_current_line = true },
    })
    require("lsp_lines").setup()
  end,
}
