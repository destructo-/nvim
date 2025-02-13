-- zx, zM zR, za
--

local configuration = {
  lang = { 'scala' },
  min_line_count = 5,
  folded = false
}

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

local function fold(import)
  local file_type = vim.bo.filetype

  vim.wo.foldtext = "v:lua.ImprtFoldsMessage()"
  vim.opt.foldmethod = "expr"
  vim.wo.foldminlines = 5
  vim.wo.foldexpr = "v:lua.ComputeImportFolds()"
  vim.wo.foldcolumn = 'auto'
end

local function init(configuration)
  fold({})
end

init()

local wk = require("which-key")

wk.add = {
  {
    'zx',
    '<CMD><ESC>',
    desc = "Refresh folds"
  },
  {
    'zO',
    desc = "Open all folds"
  }
}

