return {
  "folke/which-key.nvim",
  init = function()
    require("which-key").add {
      { "<leader>a", group = "AI", icon = { icon = " " } },
      { "<leader>e", group = "Editor", icon = { icon = "󰤌" } },
      { "<leader>l", group = "LSP", icon = { icon = " ", color = "blue" } },
      { "<leader>m", group = "Metals", icon = { icon = "", color = "red" } },
      { "<leader>t", group = "Tree", icon = { icon = "" } },
      { "<leader>o", group = "Open", icon = { icon = "" } },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>d", group = "Diagnostic", icon = { icon = "", color = "red"} },

      { "<leader>ol", '<CMD>:Lazy<CR>', desc = "Lazy plugin manager" },

      { "<leader>ev", "<CMD>vsplit<CR>", desc = "Split vertical", icon = { icon = "" } },
      { "<leader>ex", "<CMD>split<CR>", desc = "Split vertical", icon = { icon = "" } },
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
