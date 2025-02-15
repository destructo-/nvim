-- telescope.nvim is a highly extendable fuzzy finder over lists.
-- Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.

return {
  "nvim-telescope/telescope.nvim",
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
    -- git
    {
      '<leader>gs',
      '<CMD>lua require("telescope.builtin").git_status()<CR>',
      desc = 'Show status',
    },
    {
      '<leader>gS',
      '<CMD>lua require("telescope.builtin").git_stash()<CR>',
      desc = 'Show stash',
    },
    {
      '<leader>gc',
      '<CMD>lua require("telescope.builtin").git_bcommits()<CR>',
      desc = 'Commits in buffer',
    },
    {
      '<leader>gC',
      '<CMD>lua require("telescope.builtin").git_commits()<CR>',
      desc = 'Commits',
    }
  }
}
