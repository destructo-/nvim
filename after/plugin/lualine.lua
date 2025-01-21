require('lualine').setup {
  options = {
--    theme = "catppuccin",
--    theme = "gruvbox-material",
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  },
  sections = { lualine_x = { 'g:metals_status', 'g:metals_bsp_status', 'encoding', 'fileformat', 'filetype' } }
}
