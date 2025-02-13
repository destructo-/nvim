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


local configuration = {
  ensure_installed = { "lua_ls" },
  handlers = {
    ["lua_ls"] = lua_ls_setup
  }
}

require('mason-lspconfig').setup(configuration)
