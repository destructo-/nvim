require('gitsigns').setup({
  on_attach = function(_)
    local api = require('gitsigns')

    vim.keymap.set("n", "<leader>gb", function()
      api.blame()
    end)

    vim.keymap.set("n", "<leader>gc", function ()
      api.toggle_deleted()
    end)

    vim.keymap.set("n", "<leader>gu", function ()
      api.reset_hunk()
    end)

    vim.keymap.set("n", "<leader>bl", function ()
      api.blame_line()
    end)
  end
})
