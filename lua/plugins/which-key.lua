return {
  "folke/which-key.nvim",
  init = function()
    require("which-key").add {
      { "<leader>v", "<cmd>vsplit<CR>", desc = "Split vertical", icon = { icon = "" } },

      { "<leader>a", group = "AI", icon = { icon = " " } },
      { "<leader>l", group = "LSP", icon = { icon = " ", color = "blue" } },
      { "<leader>m", group = "Metals", icon = { icon = "", color = "red" } },
      { "<leader>t", group = "Tree", icon = { icon = "" } },
      { "<leader>o", group = "Open", icon = { icon = "" } },
      { "<leader>f", group = "Find" },
      { "<leader>b", group = "Buffer" },
      { "<leader>g", group = "Git" },
      { "<leader>e", group = "Errors", icon = { icon = "", color = "red"} },

      { "<leader>ol", '<CMD>:Lazy<CR>', desc = "Lazy plugin manager" },
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
    }
  }
}
