vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")
require("nvim-tree").setup({
  view = {
    width = 50,
  },
  filters = {
    dotfiles = false
  }
})

vim.keymap.set("n", "<leader>tt", function()
  api.tree.toggle({ find_file = true })
end)

vim.keymap.set("n", "<leader>tc", function()
  api.tree.collapse_all()
end)
