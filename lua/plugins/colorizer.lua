-- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
-- Highlight all color codes in document, for example: #435421 #45e

return {
  "norcalli/nvim-colorizer.lua",
  keys = {
    { '<leader>c', '<CMD>ColorizerToggle<CR>', desc = "Toggle show colors" }
  }
}
