vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.swapfile = false

vim.opt.colorcolumn = "120"

vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.list = true
vim.opt.listchars:append "eol:¬"
vim.opt.listchars:append "space:⋅"
vim.opt.fillchars:append { diff = "╱" }

vim.opt.cursorline = true

vim.opt.foldmethod = "manual"

-- vim.opt.mouse = ""
-- vim.opt.mousescroll = "ver:0,hor:0"
