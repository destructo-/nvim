-- Add support to lsp-metals integration

return {
  'scalameta/nvim-metals',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap'
  },
  ft = { "scala", "sbt", "java" },
  keys = {
    { '<leader>ma', '<CMD>MetalsAnalyzeStacktrace<CR>', desc = " [a]nalyze stacktrace" },
    { '<leader>ml', '<CMD>MetalsToggleLogs<CR>', desc = " [l]ogs toggle" },
    { '<leader>mi', '<CMD>MetalsImportBuild<CR>', desc = " [i]mport build" },
    { '<leader>ms', '<CMD>MetalsScanSources<CR>', desc = " [s]can sources" },
    { '<leader>mS', '<CMD>MetalsRunDoctor<CR>', desc = " [S]tatus" },
    { '<leader>mC', '<CMD>MetalsCompileClean<CR>', desc = " [C]lean compile" },
  },
  config = function()
    local metals_config = require("metals").bare_config()

    -- Example of settings
    metals_config.settings = {
      showInferredType = true,
      superMethodLensesEnabled = true,
      showImplicitConversionsAndClasses = true,
      showImplicitArguments = true,
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    }

    -- *READ THIS*
    -- I *highly* recommend setting statusBarProvider to either "off" or "on"
    --
    -- "off" will enable LSP progress notifications by Metals and you'll need
    -- to ensure you have a plugin like fidget.nvim installed to handle them.
    --
    -- "on" will enable the custom Metals status extension and you *have* to have
    -- a have settings to capture this in your statusline or else you'll not see
    -- any messages from metals. There is more info in the help docs about this
    metals_config.init_options.statusBarProvider = "on"
    -- metals_config.init_options.icons = "unicode"
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    metals_config.tvp = {
      panel_alignment = "right"
    }

    metals_config.on_attach = function(client, bufnr)
      require("metals").setup_dap()
      -- vim.keymap.set("n", "<leader>td", function()
      --   require("metals.tvp").reveal_in_tree()
      -- end)

      vim.cmd([[hi! link LspReferenceText CursorColumn]])
      vim.cmd([[hi! link LspReferenceRead CursorColumn]])
      vim.cmd([[hi! link LspReferenceWrite CursorColumn]])
      vim.cmd([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])
      vim.cmd([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
      vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
    end

    -- Autocmd that will actually be in charging of starting the whole thing
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      -- NOTE: You may or may not want java included here. You will need it if you
      -- want basic Java support but it may also conflict if you are using
      -- something like nvim-jdtls which also works on a java filetype autocmd.
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
