vim.api.nvim_create_autocmd('FileType', {
  desc = 'fold imports in scala files, you need to set vim.opt.foldmethod = "manual" for correct work',
  pattern = 'scala',
  group = vim.api.nvim_create_augroup('fold_imports_scala', { clear = true }),
  callback = function()
    function ComputeImportFolds(lnum)
      local import_pattern = "^import"
      local line = vim.fn.getline(lnum or vim.v.lnum)
      return line:match(import_pattern) and 1 or 0
    end

    function ImprtFoldsMessage()
      local firstLine = vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
      local lineCount = (vim.v.foldend - vim.v.foldstart) + 1
      local message = string.sub((lineCount .. " lines: " .. firstLine .. string.rep(" ", 60)), 1, 60)

      return "  " .. message .. "  "
    end

    vim.wo.foldtext = "v:lua.ImprtFoldsMessage()"
    vim.opt_local.foldmethod = "expr"
    vim.wo.foldminlines = 5
    vim.wo.foldexpr = "v:lua.ComputeImportFolds()"
    vim.wo.foldcolumn = 'auto'
  end,
})
