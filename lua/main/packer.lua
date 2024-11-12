-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  -- Color scheme
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'rebelot/kanagawa.nvim' }
  use { 'EdenEast/nightfox.nvim'  }
  use { 'sainnhe/gruvbox-material' }
  -- File tree
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } } -- optional, for file icons 
  -- Better fuzzy finder
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  -- treesiter API
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} }
  -- Show codes as colors
  use { 'norcalli/nvim-colorizer.lua' }
  -- Git information
  use { 'lewis6991/gitsigns.nvim' }
  -- Status bar
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
  -- Language Servers support
  use { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig', run = ':MasonUpdate' }
  -- Autocompletion
  use { 'hrsh7th/nvim-cmp', requires = { { 'hrsh7th/cmp-nvim-lsp' }, { 'hrsh7th/cmp-vsnip' }, { 'hrsh7th/vim-vsnip' } } }
  -- Quick scope
  use { 'jinh0/eyeliner.nvim' }
  -- Http request console
  use { 'diepm/vim-rest-console' }
  -- Scala IDE
  use { 'scalameta/nvim-metals', requires = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' } }
  -- Auto Save
  use { 'Pocco81/auto-save.nvim' }
  -- Better Quick Fix window
  use { 'kevinhwang91/nvim-bqf' }
  -- Terminal in vim
  use { 'voldikss/vim-floaterm' }
  -- shows funcitons scope
  use { 'lukas-reineke/indent-blankline.nvim' }
end)
