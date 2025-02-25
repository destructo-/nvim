return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gh", "<CMD>DiffviewFileHistory %<CR>",                           desc = "File history" },
    { "<leader>gH", "<CMD>DiffviewFileHistory<CR>",                             desc = "History" },
    { "<leader>gs", "<CMD>DiffviewOpen<CR>",                                    desc = "Status" },
    { "<leader>gD", "<CMD>DiffviewOpen origin/master...HEAD --imply-local<CR>", desc = "Diff with master" },
    { "<leader>gc", "<CMD>DiffviewClose<CR>",                                   desc = "Close diff buffers" },
  },
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    view = {
      default = { layout = "diff2_horizontal" },
      merge_tool = {
        layout = "diff2_horizontal",
        disable_diagnostics = true,
      },
      file_history = {
        layout = "diff2_horizontal",
        disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
      },
    },
  },
}
