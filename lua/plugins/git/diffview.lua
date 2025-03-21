return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gh", "<CMD>DiffviewFileHistory %<CR>",                           desc = " [h]istory for file" },
    { "<leader>gH", "<CMD>DiffviewFileHistory<CR>",                             desc = " [H]istory for project" },
    { "<leader>gs", "<CMD>DiffviewOpen<CR>",                                    desc = " [s]tatus" },
    { "<leader>gD", "<CMD>DiffviewOpen origin/master...HEAD --imply-local<CR>", desc = " [D]iff with master" },
    { "<leader>gc", "<CMD>DiffviewClose<CR>",                                   desc = " [c]lose diff buffers" },
  },
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    view = {
      default = { layout = "diff2_horizontal" },
      merge_tool = {
        layout = "diff3_horizontal",
        disable_diagnostics = true,
      },
      file_history = {
        layout = "diff2_horizontal",
        disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
      },
    },
  },
}
