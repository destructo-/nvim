-- A blazing fast and easy to configure Neovim statusline written in Lua.

local clients_lsp = function()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  if next(clients) == nil then
    return ''
  end

  local c = {}
  for _, client in pairs(clients) do
    if client.name ~= "copilot" then
      table.insert(c, client.name)
    end
  end
  return '\u{f085} ' .. table.concat(c, '/')
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "AndreM222/copilot-lualine" },
  opts = {
    options = {
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_x = { clients_lsp, { 'copilot', show_colors = true }, 'encoding', 'filetype' }
    }
  }
}
