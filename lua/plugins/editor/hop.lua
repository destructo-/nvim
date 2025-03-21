-- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.

return {
  'smoka7/hop.nvim',
  keys = {
    { 'f', "<CMD>:HopWord<CR>", "Move to by HopWord", mode = { "n", "v" } },
    { 'F', "<CMD>:HopChar1CurrentLine<CR>", "Move to by HopChar", mode = { "n", "v" } },
  },
  opts = {
    keys = 'etovxqpdygfblzhckisuran'
  }
}
