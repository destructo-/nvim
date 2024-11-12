vim.g.vrc_set_default_maping = 0
vim.g.vrc_response_default_content_type = 'application/json'
vim.g.vrc_output_buffer_name = "_OUTPUT_"
vim.g.vrc_auto_format_response_patterns = {
  json = "jq"
}

vim.keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>")
