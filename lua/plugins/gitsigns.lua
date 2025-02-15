-- Super fast git decorations implemented purely in Lua.

return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { '<leader>gb', '<CMD>Gitsigns blame<CR>',               desc = "Blame" },
    { '<leader>gl', '<CMD>Gitsigns blame_line<CR>',          desc = "Blame line" },
    { '<leader>gr', '<CMD>Gitsigns reset_hunk<CR>',          desc = "Reset hunk" },
    { '<leader>gd', '<CMD>Gitsigns toggle_deleted<CR>',      desc = "Toggle deleted" },
    { '<leader>gj', '<CMD>Gitsigns next_hunk<CR>',           desc = "Go to next hunk" },
    { '<leader>gk', '<CMD>Gitsigns prev_hunk<CR>',           desc = "Go to previous hunk" },
    { '<leader>gp', '<CMD>Gitsigns preview_hunk_inline<CR>', desc = "Preview hunk" },
  },
  init = function()
    require("gitsigns").setup()
  end,
  config = function()
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
