-- A completion engine plugin for neovim written in Lua.
-- Completion sources are installed from external repositories and "sourced".

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name }
  }
end



local kind_icons = {
  Text = " ",
  Method = "󰆧  ",
  Function = "󰊕",
  Constructor = " ",
  Field = "󰇽 ",
  Variable = "󰂡",
  Class = "󰠱 ",
  Interface = "  ",
  Module = "  ",
  Property = "󰜢 ",
  Unit = " ",
  Value = "󰎠 ",
  Enum = " ",
  Keyword = "󰌋 ",
  Snippet = " ",
  Color = "󰏘 ",
  File = "󰈙 ",
  Reference = " ",
  Folder = "󰉋 ",
  EnumMember = " ",
  Constant = "󰏿",
  Struct = "  ",
  Event = " ",
  Operator = "󰆕 ",
  TypeParameter = "󰅲",
}

local menu_icons = {
  nvim_lsp = '[󰘧]',
  vsnip = '[󰵵]',
  path = '[]',
  calc = '[󰃬]',
  nvim_lsp_signature_help = '[󰷾]',
  buffer = '[]',
  cmdline = '',
  copilot = "[ ]"
}

local function map_icons(entry, vim_item)
  vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
  vim_item.kind = kind_icons[vim_item.kind]
  vim_item.menu = menu_icons[entry.source.name]
  return vim_item
end

local fields_format = { 'menu', 'abbr', 'kind' }

return {
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },


  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
    },
    init = function()
      local cmp = require("cmp")
      local configuration = {
        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "calc" },
          { name = "nvim_lsp_signature_help" },
          { name = "buffer" },
          { name = "copilot"},
          options = {
            get_bufnrs = function()
              local buf = vim.api.nvim_get_current_buf()
              local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
              if byte_size > 1024 * 1024 then -- 1 Megabyte max
                return {}
              end
              return { buf }
            end
          }
        },
        snippet = {
          expand = function(args)
            -- Comes from vsnip
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        formatting = {
          fields = fields_format,
          format = map_icons
        },
        window = {
          completion = {
            border = border "CmpDocBorder",
            winhighlight = 'Normal:CmpPmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
            winblend = vim.o.pumblend,
            scrolloff = 0,
            col_offset = 0,
            side_padding = 0,
            scrollbar = true,
          },
          documentation = {
            --max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
            --max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
            border = border "CmpDocumentationBorder",
            winhighlight = "Normal:CmpDocumentation",
            --winhighlight = 'FloatBorder:NormalFloat',
            winblend = vim.o.pumblend,
          },
        },
        mapping = cmp.mapping.preset.insert({
          -- None of this made sense to me when first looking into this since there
          -- is no vim docs, but you can't have select = true here _unless_ you are
          -- also using the snippet stuff. So keep in mind that if you remove
          -- snippets you need to remove this select
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          -- I use tabs... some say you should stick to ins-completion but this is just here as an example
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        })
      }

      cmp.setup(configuration)

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        },
        formatting = {
          fields = fields_format,
          format = map_icons
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        formatting = {
          fields = fields_format,
          format = map_icons
        },
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end
  }
}
