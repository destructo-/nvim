local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.tvp = {
  panel_alignment = "right"
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
  vim.keymap.set("n", "<leader>td", function()
    require("metals.tvp").reveal_in_tree()
  end)

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
