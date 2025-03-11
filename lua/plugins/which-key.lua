local function toggleNumbersView()
  if vim.opt.relativenumber:get() then
    vim.opt.relativenumber = false
  else
    vim.opt.relativenumber = true
  end
end

local function toggleWrapLines()
  if vim.opt.wrap:get() then
    vim.opt.wrap = false
  else
    vim.opt.wrap = true
  end
end

return {
  "folke/which-key.nvim",
  init = function()
    require("which-key").add {
      { "<leader>a", group = "[a]I", icon = { icon = " " } },
      { "<leader>e", group = "[e]ditor", icon = { icon = "󰤌" } },
      { "<leader>l", group = "[l]SP", icon = { icon = " ", color = "blue" } },
      { "<leader>m", group = "[m]etals", icon = { icon = "", color = "red" } },
      { "<leader>t", group = "[t]ree", icon = { icon = "" } },
      { "<leader>o", group = "[o]pen", icon = { icon = "" } },
      { "<leader>f", group = "[f]ind", icon = { icon = ""} },
      { "<leader>g", group = "[g]it", icon = { icon = "󰊢", color = "red"} },
      { "<leader>d", group = "[d]iagnostic", icon = { icon = "", color = "red" } },

      { "<leader>ol", '<CMD>:Lazy<CR>', desc = " [l]azy plugin manager" },

      { "<leader>ev", "<CMD>vsplit<CR>", desc = " [v]ertical split", icon = { icon = "" } },
      { "<leader>eh", "<CMD>split<CR>", desc = " [h]orizontal split", icon = { icon = "" } },
      { "<leader>en", toggleNumbersView, desc = " [n]umbers view toggle" },
      { "<leader>el", toggleWrapLines, desc = " [l]ines wrap toggle" },
      { "<leader>ec", "<CMD>noh<CR>", desc = " [c]lear search highlightning", icon = { icon = "󰎟" } }
    }
  end,
  opts = {
    preset = "classic",
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = true,
        g = true,
      },
    },
    win = {
      no_overlap = false,
      padding = { 1, 2 },
      title = false,
      title_pos = "center",
      zindex = 1000,
      border = "none",
    },
    -- ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
    icons = {
      separator = "",
      group = "+ "
    },
  }
}
