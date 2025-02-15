-- This plugin adds indentation guides to Neovim. It uses Neovim's virtual text feature and no conceal

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = '┊' },
    scope = {
      show_start = false,
      enabled = true,
    }
  }
}
