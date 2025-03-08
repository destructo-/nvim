-- A File Explorer For Neovim Written In Lua

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_group_empty = 1

return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  keys = {
    {
      '<leader>tt',
      '<CMD>lua require("nvim-tree.api").tree.toggle({ find_file = true })<CR>',
      desc = " [t]oggle"
    },
    {
      '<leader>tc',
      '<CMD>lua require("nvim-tree.api").tree.collapse_all()<CR>',
      desc = " [c]ollapse all"
    },
    {
      '<leader>tf',
      '<CMD>lua require("nvim-tree.api").tree.find_file()<CR>',
      desc = " [f]ind current file"
    },
    {
      '<leader>to',
      '<CMD>lua require("nvim-tree.api").tree.open({ find_file = true })<CR>',
      desc = " [o]pen current file"
    },
    {
      '<leader>tg',
      '<CMD>lua require("nvim-tree.api").node.open.toggle_group_empty()<CR>',
      desc = " [g]roups toggle"
    },
  },
  opts = {
    renderer = {
      indent_markers = {
        enable = true
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "+",
            arrow_open = "-"
          }
        }
      },
      group_empty = true,
    },
    view = {
      width = 50,
    },
    filters = {
      dotfiles = false
    },
    git = {
      ignore = false,
    },
  }
}
