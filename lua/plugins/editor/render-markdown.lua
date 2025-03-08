-- Plugin to improve viewing Markdown files in Neovim

return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { "markdown", "vimwiki", "copilot-chat" },
  dependencies = {
    'echasnovski/mini.nvim'
  },
  config = function()
    require('render-markdown').setup({
      file_types = { 'markdown', 'vimwiki', 'copilot-chat' },
    })
    vim.treesitter.language.register('markdown', 'vimwiki')
    vim.treesitter.language.register('markdown', 'copilot-chat')
  end
}
