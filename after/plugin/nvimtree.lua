vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_group_empty = 1 

local api = require("nvim-tree.api")
require("nvim-tree").setup({
  renderer = {
    group_empty = true,
  },
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

vim.keymap.set("n", "<leader>tf", function ()
  api.tree.find_file()
end)

vim.keymap.set("n", "<leader>tg", function ()
  api.node.open.toggle_group_empty()
end)
