-- This plugin adds indentation guides to Neovim. It uses Neovim's virtual text feature and no conceal

local configuration = {
  indent = { char = '┊' },
  scope = {
    show_start = false,
    enabled = true
  }
}

require("ibl").setup(configuration)
