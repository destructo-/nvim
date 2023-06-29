local function status_line()
  local file_name = "%-.30t"
  local modified = " %-m"
  local right_align = "%="
  local file_type = "%y"
  local line_no = "%10([%l:%L%)]"
  local pct_thru_file = "%5p%%"

  return string.format(
    "%s%s%s%s%s%s",
    file_name,
    modified,
    right_align,
    file_type,
    line_no,
    pct_thru_file
  )
end

vim.opt.statusline = status_line()
