local configuration = {
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
      z = false,
      g = false,
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

local wk = require("which-key")
wk.setup(configuration)

wk.add {
  {
    "<leader>v",
    "<cmd>vsplit<CR>",
    desc = "Split vertical",
    icon = {
      icon = ""
    },
  },
  {
    "<leader>a",
    group = "AI",
    icon = {
      icon = " ",
    },
  },
  {
    "<leader>f",
    group = "Find",
  },
  {
    "<leader>b",
    group = "Buffer",
  },
  {
    "<leader>l",
    group = "LSP",
    icon = {
      icon = " ",
      color = "blue",
    },
  },
  {
    "<leader>g",
    group = "Git",
  },
  {
    "<leader>m",
    group = "Metals",
    icon = {
      icon = "",
    }
  },
  {
    "<leader>t",
    group = "Tree",
    icon = {
      icon = ""
    }
  },
  {
    "<leader>x",
    group = "Diagnostic"
  }
}
