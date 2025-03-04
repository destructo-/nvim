-- Super fast git decorations implemented purely in Lua.

return {
  "lewis6991/gitsigns.nvim",
  event = { "WinEnter", "BufReadPre", "BufNewFile" },
  keys = {
    { '<leader>gb', '<CMD>Gitsigns blame_line<CR>',     desc = "Blame line" },
    { '<leader>gB', '<CMD>Gitsigns blame<CR>',          desc = "Blame" },
    { '<leader>gr', '<CMD>Gitsigns reset_hunk<CR>',     desc = "Reset hunk" },
    { '<leader>gd', '<CMD>Gitsigns toggle_deleted<CR>', desc = "Toggle deleted" },
    { '<leader>gj', '<CMD>Gitsigns next_hunk<CR>',      desc = "Go to next hunk" },
    { '<leader>gk', '<CMD>Gitsigns prev_hunk<CR>',      desc = "Go to previous hunk" },
    { '<leader>gp', '<CMD>Gitsigns preview_hunk<CR>',   desc = "Preview hunk" },
    { '<leader>gl', '<CMD>Gitsigns setqflist<CR>',      desc = "File hunks" },
    { '<leader>gL', '<CMD>Gitsigns setqflist all<CR>',  desc = "All hunks" },
  },
  config = function()
    vim.cmd [[ :hi GitSignsCurrentLineBlame guifg=#817c9c ]]

    require("gitsigns").setup({
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align',
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R>',
    })

    vim.api.nvim_create_autocmd('FileType', {
      desc = 'remove rudiment symbols from blame buffer',
      pattern = 'gitsigns-blame',
      group = vim.api.nvim_create_augroup('clear_blame_buffer', { clear = true }),
      callback = function()
        vim.opt_local.list = false
      end,
    })
  end
}
