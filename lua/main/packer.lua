-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  -- Color scheme
  use { 'EdenEast/nightfox.nvim' }
  -- File tree
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } } -- optional, for file icons
  -- Better fuzzy finder
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-tree/nvim-web-devicons', opt = true } } }
  -- treesiter API
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
  -- Show codes as colors
  use { 'norcalli/nvim-colorizer.lua' }
  -- Git information
  use { 'lewis6991/gitsigns.nvim' }
  -- Status bar
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
  -- Language Servers management
  use { 'williamboman/mason.nvim', run = ':MasonUpdate' }
  -- Bridge bettween masson and lsp
  use { "williamboman/mason-lspconfig.nvim" }
  -- LSP Configurations
  use { "neovim/nvim-lspconfig" }
  -- Autocompletion
  use { 'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
      { 'hrsh7th/cmp-calc' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-buffer' },
    }
  }
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
  -- lsp notifications block
  use { 'j-hui/fidget.nvim' }
  -- show hotkeys
  use { 'folke/which-key.nvim' }
  -- pretty project debug
  use { 'folke/trouble.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
  -- render markdown foles in vim
  use { 'MeanderingProgrammer/render-markdown.nvim', requires = { 'echasnovski/mini.nvim', opt = true } }
  -- easy move above buffer
  use { 'smoka7/hop.nvim', tag = '*' }
  -- hilight word uder corsor
  -- use { 'RRethy/vim-illuminate' }
  -- ChatGpt
  use { 'jackMort/ChatGPT.nvim', requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim', 'folke/trouble.nvim', 'nvim-telescope/telescope.nvim' } }
end)
