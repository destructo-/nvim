-- file for testing, trying, debug any new configuration autocmds etc

---Get normalised colour
---@param name string like 'pink' or '#fa8072'
---@return string[]
local get_color = function(name)
  local color = vim.api.nvim_get_color_by_name(name)
  if color == -1 then
    color = vim.opt.background:get() == 'dark' and 000 or 255255255
  end

  ---Convert colour to hex
  ---@param value integer
  ---@param offset integer
  ---@return integer
  local byte = function(value, offset)
    return bit.band(bit.rshift(value, offset), 0xFF)
  end

  return { byte(color, 16), byte(color, 8), byte(color, 0) }
end

---Get visually transparent volour
---@param fg string like 'pink' or '#fa8072'
---@param bg string like 'pink' or '#fa8072'
---@param alpha integer number between 0 and 1
---@return string
local blend = function(fg, bg, alpha)
  local bg_color = get_color(bg)
  local fg_color = get_color(fg)

  ---@param i integer
  ---@return integer
  local channel = function(i)
    local ret = (alpha * fg_color[i] + ((1 - alpha) * bg_color[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format('#%02X%02X%02X', channel(1), channel(2), channel(3))
end

local base_bg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name("Normal"), 'bg')

local configuration = {
  modes = {
    normal = {
      bg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name("CursorLine"), 'bg'),
      fg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name("CursorLine"), 'fg')
    },
    insert = {
      bg = blend("#78ccc5", base_bg, 0.15),
      fg = "#78ccc5"
    },
    visual = {
      bg = blend("#9745be", base_bg, 0.15),
      fg = "#9745be"
      },
    delete = {
      bg = blend("#c75c6a", base_bg, 0.15),
      fg = "#c75c6a"
    },
    copy = {
      bg = blend("#f5c359", base_bg, 0.15),
      fg = "#f5c359"
    }
  },
}

local operator_started = false

local set_highlight = function(mode)
  local mode_colors = configuration.modes[mode]
  vim.cmd("highlight CursorLine guibg=" .. mode_colors.bg)
  if mode == "delete" or mode == "copy" then
    operator_started = true
  else
    operator_started = false
  end
end

vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  callback = function()
    set_highlight("insert")
  end
})

vim.api.nvim_create_autocmd(
  { 'CmdlineLeave', 'InsertLeave', 'TextYankPost', 'WinLeave' },
  {
    pattern = '*',
    callback = function()
      set_highlight("normal")
    end
  }
)

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '[vV\x16]:n',
  callback = function()
    set_highlight("normal")
  end
})

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*:[vV\x16]',
  callback = function()
    set_highlight("visual")
  end,
})

vim.on_key(function(key)
  local ok, current_mode = pcall(vim.fn.mode)
  if not ok then
    set_highlight("normal")
    return
  end

  if current_mode == 'n' then
    -- reset if coming back from operator pending mode
    if operator_started then
      set_highlight("normal")
      return
    end

    if key == 'y' then
      set_highlight("copy")
      return
    end

    if key == 'd' then
      set_highlight("delete")
      return
    end
  end
end)


