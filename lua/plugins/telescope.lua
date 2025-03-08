--File telescope.nvim is a highly extendable fuzzy finder over lists.
-- Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.

return {
  "nvim-telescope/telescope.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Telescope" },
  dependencies = {
    'nvim-telescope/telescope-ui-select.nvim'
  },
  main = "telescope.builtin",
  keys = {
    {
      '<leader>ff',
      '<CMD>lua require("telescope.builtin").find_files({ file_ignore_patterns = { "target/" } })<CR>',
      desc = " [f]iles"
    },
    {
      '<leader>ft',
      '<CMD>Telescope live_grep<CR>',
      desc = " [t]ext",
    },
    {
      '<leader>fs',
      '<CMD>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })<CR>',
      desc = " [s]tring",
    },
    {
      '<leader>fh',
      '<CMD>Telescope help_tags<CR>',
      desc = " [h]elp",
    },
    {
      '<leader>fl',
      '<CMD>Telescope resume<CR>',
      desc = ' [l]ast search',
    },
    -- metals
    {
      '<leader>mc',
      '<CMD>Telescope metals commands<CR>',
      desc = ' [c]ommands',
    },
    -- buffers
    {
      '<leader>fb',
      '<CMD>lua require("telescope.builtin").buffers()<CR>',
      desc = ' [b]uffers list',
    },
    -- symbols
    {
      '<leader>fd',
      '<CMD>lua require("telescope.builtin").lsp_document_symbols()<CR>',
      desc = ' [d]efenitions',
    },
    -- notifications
    {
      '<leader>fn',
      '<CMD>lua require("telescope").extensions.fidget.fidget()<CR>',
      desc = ' [n]otifications',
    },
  },
  config = function()
    local function filenameFirst(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == "." then return tail end
      return string.format("%s\t\t%s", tail, parent)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t\t.*$")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })

    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<c-p>"] = actions_layout.toggle_preview,
            ["<c-v>"] = actions.select_vertical,
            ["<c-x>"] = actions.select_horizontal,
          },
          n = {
            ["<c-p>"] = actions_layout.toggle_preview,
            ["<c-v>"] = actions.select_vertical,
            ["<c-x>"] = actions.select_horizontal,
          }
        }
      },
      pickers = {
        buffers = {
          path_display = filenameFirst,
          sort_lastused = true,
          previewer = false,
          initial_mode = "normal",
          theme = "dropdown",
          mappings = {
            i = { ["<c-d>"] = actions.delete_buffer },
            n = { ["<c-d>"] = actions.delete_buffer }
          }
        },
        find_files = {
          theme = "dropdown",
          previewer = false,
          path_display = filenameFirst,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({ initial_mode = "normal" })
        }
      }
    })
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fidget")
  end
}
