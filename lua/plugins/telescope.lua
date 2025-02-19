--File telescope.nvim is a highly extendable fuzzy finder over lists.
-- Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.

return {
  lazy = false,
  "nvim-telescope/telescope.nvim",
  dependencies = {
    'nvim-telescope/telescope-ui-select.nvim'
  },
  main = "telescope.builtin",
  keys = {
    {
      '<leader>ff',
      '<CMD>lua require("telescope.builtin").find_files({ file_ignore_patterns = { "target/" } })<CR>',
      desc = "Find files"
    },
    {
      '<leader>ft',
      '<CMD>Telescope live_grep<CR>',
      desc = "Find Text",
    },
    {
      '<leader>fs',
      '<CMD>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })<CR>',
      desc = 'Find String',
    },
    {
      '<leader>fh',
      '<CMD>Telescope help_tags<CR>',
      desc = "Find help",
    },
    {
      '<leader>fl',
      '<CMD>Telescope resume<CR>',
      desc = 'Last Search',
    },
    -- metals
    {
      '<leader>mc',
      '<CMD>Telescope metals commands<CR>',
      desc = 'Commands',
    },
    -- buffers
    {
      '<leader>bl',
      '<CMD>lua require("telescope.builtin").buffers()<CR>',
      desc = 'Show list',
    },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown()
        }
      }
    })
    -- TODO load on <leader>la (lsp code actions)
    require("telescope").load_extension("ui-select")
  end
}
