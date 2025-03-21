-- Bootstrap lazy.nvim package manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- icons
    { 'nvim-tree/nvim-web-devicons' },
    -- colorscheme
    {
      "EdenEast/nightfox.nvim",
      lazy = false,
      priority = 1000,
      init = function()
        vim.cmd.colorscheme "duskfox"
      end
    },
    { import = "plugins" },
    { import = "plugins.editor" },
    { import = "plugins.git" },
    { import = "plugins.ui-improvements" },
    { import = "plugins.extensions" },
    { import = "plugins.diagnostic" },
    { import = "plugins.ai" },
    { import = "plugins.langs" }
  },
  -- it doesn't work for nightfox
  install = { colorscheme = { "duskfox" } },
  change_detection = { enabled = false },
  checker = { enabled = true },
})
