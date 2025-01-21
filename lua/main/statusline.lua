local function status_line()
  local file_name = "%-.30t"
  local modified = " %-m"
  local right_align = "%="
  local file_type = "%y"
  local line_no = "%10([%l:%L%)]"
  local pct_thru_file = "%5p%%"

  local function metals_status()
    return vim.g["metals_status"] or ""
  end
  
  local function bsp_status()
    local status = vim.g["metals_bsp_status"]
    if status and status ~= "" then
      return " BSP: " .. status
    else
      return ""
    end
  end

  return string.format(
    "%s%s%s%s%s%s%s%s",
    file_name,
    modified,
    metals_status(),
    bsp_status(),
    right_align,
    file_type,
    line_no,
    pct_thru_file
  )
end



vim.opt.statusline = status_line()
