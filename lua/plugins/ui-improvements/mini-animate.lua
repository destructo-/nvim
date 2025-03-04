return {
  {
    'echasnovski/mini.animate',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('mini.animate').setup({
        cursor = { enable = false },
        scroll = { enable = true },
        resize = { enable = true },
        open = { enable = true },
        close = { enable = true },
      })
    end,
  },
}
