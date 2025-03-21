-- VRC is a Vim plug-in to help send requests to and display responses from RESTful services in Vim.
-- It's useful for working with REST services that use JSON to exchange
-- information between server and client such as ElasticSearch

vim.g.vrc_set_default_maping = 0
vim.g.vrc_response_default_content_type = 'application/json'
vim.g.vrc_output_buffer_name = "_OUTPUT_"
vim.g.vrc_auto_format_response_patterns = {
  json = "jq"
}

return {
  'diepm/vim-rest-console',
  ft = { "rest" },
  keys = {
    { "<leader>r", "<CMD>call VrcQuery()<CR><CR>", desc = " [r]equest (http) send" }
  }
}
