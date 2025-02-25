local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name }
  }
end

vim.diagnostic.config {
  float = { border = border "CmpDocumentationBorder" },
  virtual_text = {
    prefix = '●',
  }
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded", }
)

-- Do not forget to use the on_attach function
-- require 'lspconfig'.myserver.setup { handlers=handlers }

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to defenition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show documentation' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Find references' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature' })
    --     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    --     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    --     vim.keymap.set('n', '<space>wl', function()
    --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --     end, opts)
  end,
})



