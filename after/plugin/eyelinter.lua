-- Move faster with unique f/F indicators for each word on the line. Like quick-scope, but in Lua.
-- An always-on highlight for a unique character in every word on a line to help you use f, F and family.

local configuration = {
  highlight_on_key = true, -- this must be set to true for dimming to work!
  dim = true,
}

require("eyeliner").setup(configuration)
