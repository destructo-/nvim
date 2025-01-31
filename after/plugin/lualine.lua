-- A blazing fast and easy to configure Neovim statusline written in Lua.

local clients_lsp = function()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.buf_get_clients(bufnr)
  if next(clients) == nil then
    return ''
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return '\u{f085} ' .. table.concat(c, '|')
end

local configuration = {
  options = {
    --    theme = "catppuccin",
    --    theme = "gruvbox-material",
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    --    lualine_c = { 'filename', 'g:metals_status' },
    lualine_x = { clients_lsp, 'encoding', 'filetype' }
  }
}

require('lualine').setup(configuration)
