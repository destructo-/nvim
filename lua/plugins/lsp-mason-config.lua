local function lua_ls_setup()
  local lspconfig = require("lspconfig")
  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true)
        }
      }
    }
  }
end

return {
  -- Language Servers management
  {
    "williamboman/mason.nvim",
    dependencies = {
      -- Bridge bettween masson and lsp
      "williamboman/mason-lspconfig.nvim"
    },
    lazy = false,
    priority = 900,
    keys = {
      { '<leader>om', '<CMD>:Mason<CR>', desc = "Mason language servers manager" }
    },
    init = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = { "lua_ls" },
        handlers = {
          ["lua_ls"] = lua_ls_setup
        }
      })
    end
  },

  -- LSP Configurations
  {
    "neovim/nvim-lspconfig",
    main = "lspconfig",
    keys = {
      { '<leader>lf', '<CMD>lua vim.lsp.buf.format({ async = true })<CR>', desc = "Code format" },
      { '<leader>la', '<CMD>lua vim.lsp.buf.code_action()<CR>', desc = "Code actions" },
      { '<leader>lr', '<CMD>lua vim.lsp.buf.rename()<CR>', desc = "Rename" },
      { '<leader>lD', '<CMD>lua vim.lsp.buf.type_definition()<CR>', desc = "Type defenition" },
      { '<leader>ll', '<CMD>lua vim.lsp.codelens.run()<CR>', desc = "Code lense" },
      { '<leader>lS', '<CMD>LspStop<CR>', desc = "Stop LSP service" },
      { '<leader>lR', '<CMD>LspStart<CR>', desc = "Run LSP srver" }
    }
  }
}
